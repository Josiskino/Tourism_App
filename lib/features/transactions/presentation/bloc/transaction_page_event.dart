import 'package:equatable/equatable.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class InitiateTransactionEvent extends TransactionEvent {
  final int reservationId;
  final String network;
  final String phoneNumber;
  final String currency;

  const InitiateTransactionEvent({
    required this.reservationId,
    required this.network,
    required this.phoneNumber,
    this.currency = 'XOF',
  });

  @override
  List<Object?> get props => [reservationId, network, phoneNumber, currency];
}