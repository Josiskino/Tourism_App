import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:myapp/features/auth/domain/entities/agency.dart';
import 'package:myapp/features/auth/domain/repositories/agency_repository.dart';
import 'package:myapp/core/params/params.dart';

class AgencyRepositoryImpl implements AgencyRepository {
  final AuthRemoteDataSource remoteDataSource;

  AgencyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Agency>> loginAgency(TemplateParams params) async {
    try {
      final response = await remoteDataSource.login(params.params);

      if (response.success) {
        final data = response.data;

        if (data != null && data.userModel != null) {
          final agency = data.userModel as Agency;
          return Right(agency);
        } else {
          return const Left(Failure('User model is null'));
        }
      } else {
        return Left(Failure(response.message ?? 'Unknown error'));
      }
    } catch (error) {
      return const Left(Failure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, void>> registerAgency(TemplateParams params) async {
    try {
      final response = await remoteDataSource.registerAgency(params.params);

      if (response.success) {
        return const Right(null); 
      } else {
        return Left(Failure(response.message ?? 'Unknown error'));
      }
    } catch (error) {
      return const Left(Failure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<Agency>>> getAllAgencies() {
    // TODO: implement getAllAgencies
    throw UnimplementedError();
  }
}
