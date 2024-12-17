

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/reservation.dart';

abstract class ReservationRepository {
  Future<Either<Failure, Reservation>> createReservation(TemplateParams reservationData);
  Future<Either<Failure, List<Reservation>>> getReservations();
  Future<Either<Failure, void>> cancelReservation(int reservationId);
}