import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';


import '../../../../core/util/api_response_exception.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote/auth_remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.remoteDataSource});

  final AuthRemoteDataSource remoteDataSource;
  @override
  Future<Either<Failure, UserModel>> login(TemplateParams data) async {
    final response = await remoteDataSource.login(data.params);
    if (response != null) {
      return Right(response);
    } else {
      return Left(ServerFailure('Unknown error'));
    }
  }

  @override
  // Future<Either<Failure, void>> register(TemplateParams data) async {
  //   try {
  //     final success = await remoteDataSource.register(data.params);
  //     return Right(success);
  //   } on ApiResponseException catch (e) {
  //     String userFriendlyMessage;
  //     switch (e.message) {
  //       case 'Email already exists':
  //         userFriendlyMessage = 'Cet email est déjà utilisé';
  //         break;
  //       case 'Invalid password':
  //         userFriendlyMessage = 'Le mot de passe ne respecte pas les critères de sécurité';
  //         break;
  //       default:
  //         userFriendlyMessage = 'Échec de l\'inscription. Veuillez réessayer.';
  //     }
  //     return Left(ServerFailure(userFriendlyMessage));
  //   } catch (e) {
  //     // Message générique pour toute autre erreur
  //     return Left(ServerFailure('Un problème est survenu. Veuillez réessayer.'));
  //   }
  // }

  //Ce qui marchait mais je le commente pour le moment
  // Future<Either<Failure, void>> register(TemplateParams data) async {
  //   try {
  //     final success = await remoteDataSource.register(data.params);

  //     if (success) {
  //       return const Right(null);
  //     } else {
  //       return Left(ServerFailure('Registration failed for unknown reasons'));
  //     }
  //   } catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }

  Future<Either<Failure, void>> register(TemplateParams data) async {
    try {
      final success = await remoteDataSource.register(data.params);
      return success
          ? const Right(null)
          : Left(ServerFailure('Échec de l\'inscription'));
    } on ApiResponseException catch (e) {
      switch (e.message) {
        case 'Email already exists':
          return Left(ServerFailure('Cet email est déjà utilisé'));
        case 'Invalid password':
          return Left(ServerFailure('Mot de passe invalide'));
        default:
          return Left(ServerFailure('Erreur lors de l\'inscription'));
      }
    } catch (e) {
      return Left(ServerFailure('Erreur inattendue'));
    }
  }
}
