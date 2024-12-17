
import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';


import '../../domain/repositories/reservation_repository.dart';
import '../datasources/remote/reservation_data_source.dart';
import '../models/reservation_model.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationDataSource remoteDataSource;

  ReservationRepositoryImpl({required this.remoteDataSource});

  
  @override
  Future<Either<Failure, void>> cancelReservation(int reservationId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ReservationModel>> createReservation(TemplateParams reservationData) async {
    try {
      final response = await remoteDataSource.createReservation(reservationData.params);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Unknown error'));
    }
  }

  @override
  Future<Either<Failure, List<ReservationModel>>> getReservations() async {
    try {
      final response = await remoteDataSource.getAllReservations();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Unknown error'));
    }
  }
  
}