import 'package:equatable/equatable.dart';
import '../../domain/entities/reservation.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();
  
  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationCreated extends ReservationState {
  final Reservation reservation;

  const ReservationCreated({required this.reservation});

  @override
  List<Object> get props => [reservation];
}

class ReservationsLoaded extends ReservationState {
  final List<Reservation> reservations;

  const ReservationsLoaded({required this.reservations});

  @override
  List<Object> get props => [reservations];
}

class ReservationCancelled extends ReservationState {}

class ReservationError extends ReservationState {
  final String message;

  const ReservationError({required this.message});

  @override
  List<Object> get props => [message];
}