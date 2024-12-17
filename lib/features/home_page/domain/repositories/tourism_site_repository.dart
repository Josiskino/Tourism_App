import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/tourism_site.dart';

abstract class  TourismSiteRepository {
  Future<Either<Failure, List<TourismSite>>> getSites(TemplateParams params);
}