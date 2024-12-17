

import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';

import '../../../../core/params/params.dart';
import '../../../../core/abstract/usescase/usecase.dart';
import '../../data/models/user_model.dart';
import '../repositories/user_repository.dart';


class LoginUsecase implements Usecase<UserModel, TemplateParams> {
  final UserRepository repository;
  LoginUsecase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(TemplateParams data) async {
    return await repository.login(data);
  }
  
}