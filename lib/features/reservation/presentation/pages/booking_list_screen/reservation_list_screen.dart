import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:myapp/core/util/screen_size.dart';

import '../../../../../init_dependancies.dart';
import '../../../../transactions/presentation/pages/payment_screen/payment_screen.dart';
import '../../../domain/entities/reservation.dart';
import '../../bloc/reservation_page_bloc.dart';
import '../../bloc/reservation_page_event.dart';
import '../../bloc/reservation_page_state.dart';

class ReservationListScreen extends StatelessWidget {
  const ReservationListScreen({super.key});

  String generateTransactionNumber() {
    // Combinaison de la date, de l'heure et d'un nombre aléatoire
    final now = DateTime.now();
    final timestamp = DateFormat('yyyyMMddHHmmss').format(now);
    final randomSuffix = Random().nextInt(9999).toString().padLeft(4, '0');
    return 'RES-$timestamp-$randomSuffix';
  }

    // Nouvelle méthode pour afficher le bottom sheet de paiement
  void _showPaymentBottomSheet(BuildContext context, Reservation reservation) {
    // Ne pas afficher le bottom sheet si la réservation est déjà payée
    if (reservation.status == 2) return; // 2 représente le statut "Payé"

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => PaymentMethodsSheet(
        totalAmount: reservation.amount,
        onPaymentComplete: () {
          // Dispatch un événement pour mettre à jour le statut de la réservation
          // context.read<ReservationBloc>().add(
          //       UpdateReservationStatusEvent(
          //         reservationId: reservation.id!,
          //         newStatus: 2, // Statut "Payé"
          //       ),
          //     );
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Paiement réussi pour la réservation'),
              backgroundColor: Colors.green,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes Réservations',
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeUtil.textSize(4.5),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            serviceLocator<ReservationBloc>()..add(FetchReservationsEvent()),
        child: BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            if (state is ReservationLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ReservationsLoaded) {
              return state.reservations.isEmpty
                  ? _buildEmptyState()
                  : _buildReservationList(state.reservations, context);
            }

            if (state is ReservationError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Erreur de chargement',
                      style: TextStyle(fontSize: SizeUtil.textSize(4)),
                    ),
                    Text(
                      state.message,
                      style: TextStyle(
                          fontSize: SizeUtil.textSize(3.5), color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () => context
                          .read<ReservationBloc>()
                          .add(FetchReservationsEvent()),
                      child: const Text('Réessayer'),
                    )
                  ],
                ),
              );
            }

            return _buildEmptyState();
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 20),
          Text(
            'Aucune réservation pour le moment',
            style: TextStyle(
              fontSize: SizeUtil.textSize(4),
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReservationList(
      List<Reservation> reservations, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ReservationBloc>().add(FetchReservationsEvent());
      },
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: reservations.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return _buildReservationItem(reservation, context);
        },
      ),
    );
  }

  Widget _buildReservationItem(Reservation reservation, BuildContext context) {
    return GestureDetector(
      onTap: reservation.status != 2 
          ? () => _showPaymentBottomSheet(context, reservation)
          : null,
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => _showCancelDialog(reservation, context),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Annuler',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Réservation #${generateTransactionNumber()}',
                          //'Réservation #${reservation.id ?? "N/A"}',
                          style: TextStyle(
                            fontSize: SizeUtil.textSize(3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _buildReservationStatus(reservation.status),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        Text(
                          '',
                          //'Site: ${reservation.siteName ?? "Site non spécifié"}',
                          style: TextStyle(
                            fontSize: SizeUtil.textSize(3.1),
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Date: ${reservation.startDate}',
                              style: TextStyle(
                                fontSize: SizeUtil.textSize(3.3),
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Heure: ${reservation.reservationTime ?? "Non spécifiée"}',
                              style: TextStyle(
                                fontSize: SizeUtil.textSize(3.3),
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          //'Montant: ${reservation.amount} XOF',
                          'Montant: ${NumberFormat('#.###').format(reservation.amount)} XOF',
                          style: TextStyle(
                            fontSize: SizeUtil.textSize(3.3),
                            color: const Color(0xFFFF983F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // Logique de paiement à implémenter
                        //     _showPaymentDialog(reservation, context);
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.blue,
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 6),
                        //   ),
                        //   child: Text(
                        //     'Payer',
                        //     style: TextStyle(
                        //       fontSize: SizeUtil.textSize(3),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReservationStatus(int status) {
    String statusText;
    Color statusColor;

    switch (status) {
      case 1: // En attente
        statusText = 'En attente';
        statusColor = Colors.orange;
        break;
      case 2: // Confirmé
        statusText = 'Confirmé';
        statusColor = Colors.green;
        break;
      case 3: // Annulé
        statusText = 'Annulé';
        statusColor = Colors.red;
        break;
      default:
        statusText = 'Statut inconnu';
        statusColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        statusText,
        style: TextStyle(
          color: statusColor,
          fontSize: SizeUtil.textSize(3),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showCancelDialog(Reservation reservation, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Annuler la réservation'),
          content:
              const Text('Voulez-vous vraiment annuler cette réservation ?'),
          actions: [
            TextButton(
              child: const Text('Non'),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            ElevatedButton(
              child: const Text('Oui'),
              onPressed: () {
                // Dispatch un événement pour annuler la réservation
                context.read<ReservationBloc>().add(
                    CancelReservationEvent(reservationId: reservation.id!));
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
