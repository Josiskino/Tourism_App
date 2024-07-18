import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/exceptions.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:myapp/features/auth/domain/entities/tourist.dart';
import 'package:myapp/features/auth/domain/repository/tourist_repository.dart';
import 'package:myapp/features/auth/data/models/tourist_model.dart';

class TouristRepositoryImpl implements TouristRepository {
  final AuthRemoteDataSource remoteDataSource;

  TouristRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Tourist>> registerTourist(Tourist tourist) async {
    try {
      final touristModel = await remoteDataSource.registerTourist(TouristModel(
        id: tourist.id,
        userId: tourist.userId,
        touristName: tourist.touristName,
      ).toJson());
      return Right(touristModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Tourist>>> getAllTourists() {
    // Implementation de la méthode getAllTourists si nécessaire
    throw UnimplementedError();
  }
}
