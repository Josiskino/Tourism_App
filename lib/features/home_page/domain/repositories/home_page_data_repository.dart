import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/category.dart';
import '../entities/tourism_site.dart';

abstract class HomeRepository {
  Future<Either<Failure, ({
    List<Category> categories, 
    List<TourismSite> recentSites
  })>> getHomePageData();
}