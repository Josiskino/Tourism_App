import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/usescase.dart/usecase.dart';
import 'package:myapp/features/auth/domain/entities/agency.dart';
import 'package:myapp/features/auth/domain/repository/agency_repository.dart';

class RegisterAgencyUseCase implements Usecase<Agency, RegisterAgencyParams> {
  final AgencyRepository repository;

  RegisterAgencyUseCase({required this.repository});

  @override
  Future<Either<Failure, Agency>> call(RegisterAgencyParams params) async {
    return await repository.registerAgency(Agency(
      id: params.id,
      userId: params.userId,
      agencyName: params.agencyName,
      agencyResponsibleName: params.agencyResponsibleName,
    ));
  }
}

class RegisterAgencyParams {
  final int id;
  final int userId;
  final String agencyName;
  final String agencyResponsibleName;

  RegisterAgencyParams({
    required this.id,
    required this.userId,
    required this.agencyName,
    required this.agencyResponsibleName,
  });
}
