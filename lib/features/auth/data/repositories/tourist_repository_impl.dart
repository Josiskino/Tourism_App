// import 'package:fpdart/fpdart.dart';
// import 'package:myapp/core/error/failure.dart';
// import 'package:myapp/features/auth/data/datasources/remote/auth_remote_data_source.dart';
// import 'package:myapp/features/auth/domain/entities/tourist.dart';
// import 'package:myapp/features/auth/domain/repositories/tourist_repository.dart';
// import 'package:myapp/core/params/params.dart';

// class TouristRepositoryImpl implements TouristRepository {
//   final AuthRemoteDataSource remoteDataSource;

//   TouristRepositoryImpl({required this.remoteDataSource});

//   @override
//   Future<Either<Failure, void>> registerTourist(TemplateParams params) async {
//     try {
//       final response = await remoteDataSource.registerTourist(params.params);

//       if (response.success) {
//         return const Right(null);
//       } else {
//         return Left(ServerFailure(response.message ?? 'Unknown error'));
//       }
//     } catch (e) {
//       return Left(ServerFailure('An error occurred: ${e.toString()}'));
//     }
//   }

//   @override
//   Future<Either<Failure, Tourist>> loginTourist(TemplateParams params) async {
//     try {
//       final response = await remoteDataSource.login(params.params);

//       if (response.success) {
//         final data = response.data;

//         if (data != null && data.userModel != null) {
//           final tourist = data.userModel as Tourist;
//           return Right(tourist);
//         } else {
//           return Left(ServerFailure('User model is null'));
//         }
//       } else {
//         return Left(ServerFailure(response.message ?? 'Unknown error'));
//       }
//     } catch (e) {
//       return Left(ServerFailure('An error occurred: ${e.toString()}'));
//     }
//   }

//   @override
//   Future<Either<Failure, List<Tourist>>> getAllTourists() async {
//     throw UnimplementedError();
//   }
// }
