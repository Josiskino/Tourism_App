import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> loginInWithEmailAndPassword({
    required String email,
    required String password,
  });
}