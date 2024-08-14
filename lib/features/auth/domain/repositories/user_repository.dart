import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/features/auth/data/models/user_type.dart';

abstract class UserRepository {
  Future<Either<Failure, UserType>> login(TemplateParams params);
}
