import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/params/params.dart';
import '../entities/tourist.dart';
import 'package:myapp/core/error/failure.dart';

abstract class TouristRepository {
  Future<Either<Failure, Tourist>> loginTourist(TemplateParams params);
  Future<Either<Failure, void>> registerTourist(TemplateParams params);
  Future<Either<Failure, List<Tourist>>> getAllTourists();
}
