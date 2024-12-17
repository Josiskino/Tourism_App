
import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';

import '../../../../core/abstract/usescase/usecase.dart';
import '../entities/reservation.dart';
import '../repositories/reservation_repository.dart';

class ListReservationUsescase implements Usecase {
  final ReservationRepository repository;

  ListReservationUsescase({required this.repository});
  @override
  Future<Either<Failure, List<Reservation>>> call(params) async {
    return await repository.getReservations();
  }
  
}