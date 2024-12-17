import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/features/auth/domain/repositories/tourist_repository.dart';

import '../../../../core/abstract/usescase/usecase.dart';
import '../entities/tourist.dart';

class LoginTouristUseCase implements Usecase<Tourist, TemplateParams> {
  final TouristRepository repository;

  LoginTouristUseCase({required this.repository});

  @override
  Future<Either<Failure, Tourist>> call(TemplateParams params) async {
    return await repository.loginTourist(params);
  }
}