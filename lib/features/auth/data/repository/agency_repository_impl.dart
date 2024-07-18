import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/exceptions.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:myapp/features/auth/domain/entities/agency.dart';
import 'package:myapp/features/auth/domain/repository/agency_repository.dart';
import 'package:myapp/features/auth/data/models/agency_model.dart';

class AgencyRepositoryImpl implements AgencyRepository {
  final AuthRemoteDataSource remoteDataSource;

  AgencyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Agency>> registerAgency(Agency agency) async {
    try {
      final agencyModel = await remoteDataSource.registerAgency(AgencyModel(
        id: agency.id,
        userId: agency.userId,
        agencyName: agency.agencyName,
        agencyResponsibleName: agency.agencyResponsibleName,
      ).toJson());
      return Right(agencyModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Agency>>> getAllAgencies() {
    // Implementation de la méthode getAllAgencies si nécessaire
    throw UnimplementedError();
  }
}
