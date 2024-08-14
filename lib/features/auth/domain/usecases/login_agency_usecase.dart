import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/features/auth/domain/repositories/agency_repository.dart';

import '../../../../core/usescase.dart/usecase.dart';
import '../entities/agency.dart';

class LoginAgencyUseCase implements Usecase<Agency, TemplateParams> {
  final AgencyRepository repository;

  LoginAgencyUseCase({required this.repository});

  @override
  Future<Either<Failure, Agency>> call(TemplateParams params) async {
    return await repository.loginAgency(params);
  }
}