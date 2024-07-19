import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/usescase.dart/usecase.dart';
import 'package:myapp/features/auth/domain/entities/tourist.dart';
import 'package:myapp/features/auth/domain/repository/tourist_repository.dart';

class RegisterTouristUseCase implements Usecase<Tourist, RegisterTouristParams> {
  final TouristRepository repository;

  RegisterTouristUseCase({required this.repository});

  @override
  Future<Either<Failure, Tourist>> call(RegisterTouristParams params) async {
    return await repository.registerTourist(Tourist(
      id: params.id,
      userId: params.userId,
      touristName: params.touristName,
    ));
  }
}

class RegisterTouristParams {
  final int id;
  final int userId;
  final String touristName;

  RegisterTouristParams({
    required this.id,
    required this.userId,
    required this.touristName,
  });
}
