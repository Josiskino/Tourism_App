import 'package:equatable/equatable.dart';
import 'package:myapp/core/params/params.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class CreateReservationEvent extends ReservationEvent {
  final TemplateParams reservationData;

  const CreateReservationEvent({required this.reservationData});

  @override
  List<Object> get props => [reservationData];
}

class FetchReservationsEvent extends ReservationEvent {}

class CancelReservationEvent extends ReservationEvent {
  final int reservationId;

  const CancelReservationEvent({required this.reservationId});

  @override
  List<Object> get props => [reservationId];
}