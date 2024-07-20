import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/exceptions.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:myapp/features/auth/domain/entities/tourist.dart';
import 'package:myapp/features/auth/domain/repositories/tourist_repository.dart';

class TouristRepositoryImpl implements TouristRepository {
  final AuthRemoteDataSource remoteDataSource;

  TouristRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Tourist>> registerTourist(TemplateParams params) async {
    try {
      final touristModel = await remoteDataSource.registerTourist(params.params);
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
