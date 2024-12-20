import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/features/auth/domain/repositories/agency_repository.dart';

import '../../../../core/abstract/usescase/usecase.dart';

class RegisterAgencyUseCase implements Usecase<void, TemplateParams> {
  final AgencyRepository repository;

  RegisterAgencyUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(TemplateParams params) async {
    return await repository.registerAgency(params);
  }
}
