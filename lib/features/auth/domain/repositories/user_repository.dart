import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login(TemplateParams params);
  Future<Either<Failure, User>> registerUser(User user);
}
