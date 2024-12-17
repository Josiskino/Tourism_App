import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/create_reservation_usescase.dart';
import '../../domain/usecases/list_reservation_usescase.dart';
import 'reservation_page_event.dart';
import 'reservation_page_state.dart';



class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final CreateReservationUsescase createReservationUsecase;
  final ListReservationUsescase listReservationUsecase;

  ReservationBloc({
    required this.createReservationUsecase,
    required this.listReservationUsecase,
  }) : super(ReservationInitial()) {
    on<CreateReservationEvent>(_onCreateReservation);
    on<FetchReservationsEvent>(_onFetchReservations);
    // Décommentez et implémentez si vous ajoutez la fonctionnalité d'annulation
    // on<CancelReservationEvent>(_onCancelReservation);
  }

  Future<void> _onCreateReservation(
    CreateReservationEvent event, 
    Emitter<ReservationState> emit
  ) async {
    emit(ReservationLoading());
    
    final result = await createReservationUsecase(event.reservationData);
    
    result.fold(
      (failure) => emit(ReservationError(message: failure.message)),
      (reservation) => emit(ReservationCreated(reservation: reservation))
    );
  }

  Future<void> _onFetchReservations(
    FetchReservationsEvent event, 
    Emitter<ReservationState> emit
  ) async {
    emit(ReservationLoading());
    
    final result = await listReservationUsecase(null);
    
    result.fold(
      (failure) => emit(ReservationError(message: failure.message)),
      (reservations) => emit(ReservationsLoaded(reservations: reservations))
    );
  }

  // À implémenter si vous ajoutez la fonctionnalité d'annulation
  // Future<void> _onCancelReservation(
  //   CancelReservationEvent event, 
  //   Emitter<ReservationState> emit
  // ) async {
  //   emit(ReservationLoading());
    
  //   final result = await cancelReservationUsecase(event.reservationId);
    
  //   result.fold(
  //     (failure) => emit(ReservationError(message: failure.message)),
  //     (_) => emit(ReservationCancelled())
  //   );
  // }
}