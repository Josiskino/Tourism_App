import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> registerUser(User user);
}
