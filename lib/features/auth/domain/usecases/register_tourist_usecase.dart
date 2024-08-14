import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/core/usescase.dart/usecase.dart';
import 'package:myapp/features/auth/domain/repositories/tourist_repository.dart';

class RegisterTouristUseCase implements Usecase<void, TemplateParams> {
  final TouristRepository repository;

  RegisterTouristUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(TemplateParams params) async {
    return await repository.registerTourist(params);
  }
}
