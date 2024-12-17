import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';

import '../../../../core/params/params.dart';
import '../../../../core/abstract/usescase/usecase.dart';
import '../repositories/user_repository.dart';

class RegisterUsecase implements Usecase<void, TemplateParams> {
  final UserRepository repository;
  RegisterUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(TemplateParams params) async {
    return await repository.register(params);
  }
  
}