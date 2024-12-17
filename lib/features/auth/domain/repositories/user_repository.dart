import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';

import '../../data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> login(TemplateParams params);
  Future<Either<Failure, void>> register(TemplateParams params);
}
