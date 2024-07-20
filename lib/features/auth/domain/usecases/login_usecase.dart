import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/core/usescase.dart/usecase.dart';
import 'package:myapp/features/auth/domain/entities/user.dart';
import 'package:myapp/features/auth/domain/repositories/user_repository.dart';

class LoginUseCase implements Usecase<User, TemplateParams> {
  final UserRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call(TemplateParams params) async {
    return await repository.login(params);
  }
}

