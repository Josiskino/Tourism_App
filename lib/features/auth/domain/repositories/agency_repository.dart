import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/params/params.dart';
import '../entities/agency.dart';
import 'package:myapp/core/error/failure.dart';

abstract class AgencyRepository {
  Future<Either<Failure, Agency>> registerAgency(TemplateParams params);
  Future<Either<Failure, List<Agency>>> getAllAgencies();
}
