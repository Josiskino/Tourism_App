import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/abstract/usescase/usecase.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/tourism_site.dart';
import '../repositories/home_page_data_repository.dart';

class HomePageUseCases implements Usecase<({
  List<Category> categories, 
  List<TourismSite> recentSites
}), NoParams> {
  final HomeRepository repository;

  HomePageUseCases({required this.repository});

  @override
  Future<Either<Failure, ({
    List<Category> categories, 
    List<TourismSite> recentSites
  })>> call(NoParams params) async {
    return await repository.getHomePageData();
  }
}

