import 'package:fpdart/src/either.dart';

import 'package:myapp/core/error/failure.dart';

import '../../../../core/abstract/usescase/usecase.dart';
import '../entities/reservation.dart';
import '../repositories/reservation_repository.dart';

class CreateReservationUsescase implements Usecase {
  final ReservationRepository repository;

  CreateReservationUsescase({required this.repository});
  @override
  Future<Either<Failure, Reservation>> call(params) async {
    print("Je suis dans le usecase");
    print(params);
    return await repository.createReservation(params);
    
  }
}
