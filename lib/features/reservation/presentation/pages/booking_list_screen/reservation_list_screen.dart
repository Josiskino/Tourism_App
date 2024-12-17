import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../../core/util/screen_size.dart';
import '../../../../home_page/domain/entities/tourism_site.dart';
import '../../../../../payment_screen/payment_screen.dart';

class ReservationListScreen extends StatefulWidget {
  final Reservation? newReservation;

  const ReservationListScreen({super.key, this.newReservation});

  @override
  _ReservationListScreenState createState() => _ReservationListScreenState();
}

class _ReservationListScreenState extends State<ReservationListScreen> {
  List<Reservation> reservations = [];

  @override
  void initState() {
    super.initState();
    // Ajouter la nouvelle réservation si elle existe
    if (widget.newReservation != null) {
      // Par défaut, le statut est en attente (pending)
      widget.newReservation!.status = ReservationStatus.pending;
      reservations.add(widget.newReservation!);
    }
  }

  void _showPaymentBottomSheet(Reservation reservation) {
    // Ne pas afficher le bottom sheet si la réservation est déjà payée
    if (reservation.status == ReservationStatus.paid) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => PaymentMethodsSheet(
        totalAmount: reservation.totalPrice,
        onPaymentComplete: () {
          setState(() {
            reservation.status = ReservationStatus.paid;
          });
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Paiement réussi pour ${reservation.site.name}'),
              backgroundColor: Colors.green,
            ),
          );
        },
      ),
    );
  }

  void _cancelReservation(Reservation reservation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Annuler la réservation'),
          content: const Text('Voulez-vous vraiment annuler cette réservation ?'),
          actions: [
            TextButton(
              child: const Text('Non'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Oui'),
              onPressed: () {
                setState(() {
                  reservations.remove(reservation);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Réservation annulée'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            ),
          ],
        );
      },
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
      body: reservations.isEmpty
          ? _buildEmptyState()
          : _buildReservationList(),
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

  Widget _buildReservationList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: reservations.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final reservation = reservations[index];
        return _buildReservationItem(reservation);
      },
    );
  }

  Widget _buildReservationItem(Reservation reservation) {
    return Slidable(
      // Actions de gauche à droite
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _cancelReservation(reservation),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Annuler',
          ),
        ],
      ),

      // Contenu principal de la réservation
      child: GestureDetector(
        onTap: reservation.status != ReservationStatus.paid
            ? () => _showPaymentBottomSheet(reservation)
            : null,
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
          child: Row(
            children: [
              // Image du site
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(10)),
                child: Image.network(
                  reservation.site.photos.first.url,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              
              // Contenu de la réservation
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              reservation.site.name,
                              style: TextStyle(
                                fontSize: SizeUtil.textSize(3.8),
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          _buildReservationStatus(reservation.status),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${DateFormat('dd MMM yyyy').format(reservation.date)} à ${reservation.time}',
                        style: TextStyle(
                          fontSize: SizeUtil.textSize(3.3),
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${reservation.numberOfPersons} personne(s)',
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.3),
                            ),
                          ),
                          Text(
                            'XOF ${NumberFormat('#,###').format(reservation.totalPrice)}',
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.3),
                              color: const Color(0xFFFF983F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReservationStatus(ReservationStatus status) {
    String statusText;
    Color statusColor;

    switch (status) {
      case ReservationStatus.pending:
        statusText = 'En attente';
        statusColor = Colors.orange;
        break;
      case ReservationStatus.paid:
        statusText = 'Payé';
        statusColor = Colors.green;
        break;
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
}

// Énumération pour les statuts de réservation
enum ReservationStatus {
  pending,
  paid,
}

// Mise à jour du modèle de Réservation
class Reservation {
  final TourismSite site;
  final int numberOfPersons;
  final DateTime date;
  final String time;
  final double totalPrice;
  ReservationStatus status;

  Reservation({
    required this.site,
    required this.numberOfPersons,
    required this.date,
    required this.time,
    required this.totalPrice,
    this.status = ReservationStatus.pending,
  });
}