import 'package:fpdart/fpdart.dart';
import '../entities/agency.dart';
import 'package:myapp/core/error/failure.dart';

abstract class AgencyRepository {
  Future<Either<Failure, Agency>> registerAgency(Agency agency);
  Future<Either<Failure, List<Agency>>> getAllAgencies();
}
