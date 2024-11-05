// import 'package:fpdart/fpdart.dart';
// import 'package:myapp/core/error/exceptions.dart';
// import 'package:myapp/core/error/failure.dart';
// import 'package:myapp/features/auth/domain/repositories/auth_repository.dart';

// import '../../../features/auth/data/datasources/remote/auth_remote_data_source.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   final AuthRemoteDataSource remoteDataSource;

//   const AuthRepositoryImpl({required this.remoteDataSource});

//   @override
//   Future<Either<Failure, String>> loginInWithEmailAndPassword({required String email, required String password}) {
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<Failure, String>> signUpWithEmailAndPassword({
//     required String name, 
//     required String email, 
//     required String password,
//     }) async {
//     try {
//       final userId = await remoteDataSource.signUpWithEmailAndPassword(
//         name: name, 
//         email: email, 
//         password: password,
//       );
//       return right(userId);
//     } on ServerException catch (e) {
//       return left(Failure(e.message));
//     }
//   }
  
// }