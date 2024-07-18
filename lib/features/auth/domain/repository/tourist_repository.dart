import 'package:fpdart/fpdart.dart';
import '../entities/tourist.dart';
import 'package:myapp/core/error/failure.dart';

abstract class TouristRepository {
  Future<Either<Failure, Tourist>> registerTourist(Tourist tourist);
  Future<Either<Failure, List<Tourist>>> getAllTourists();
}
