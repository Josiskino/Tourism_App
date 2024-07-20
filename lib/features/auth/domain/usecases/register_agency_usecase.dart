import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/core/usescase.dart/usecase.dart';
import 'package:myapp/features/auth/domain/entities/agency.dart';
import 'package:myapp/features/auth/domain/repositories/agency_repository.dart';

class RegisterAgencyUseCase implements Usecase<Agency, TemplateParams> {
  final AgencyRepository repository;

  RegisterAgencyUseCase({required this.repository});

  @override
  Future<Either<Failure, Agency>> call(TemplateParams params) async {
    return await repository.registerAgency(params);
  }
}
