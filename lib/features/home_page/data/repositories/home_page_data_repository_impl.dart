import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';

import '../../../../core/util/api_response_exception.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/tourism_site.dart';
import '../../domain/repositories/home_page_data_repository.dart';
import '../datasources/remote/home_page_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ({
    List<Category> categories, 
    List<TourismSite> recentSites
  })>> getHomePageData() async {
    try {
      final response = await remoteDataSource.getHomePageData();
      
      return Right((
        categories: response.categories,
        recentSites: response.recentSites
      ));
    } on ApiResponseException catch (e) {
      
      String userFriendlyMessage;
      switch (e.message) {
        case 'Aucune donnée de page d\'accueil':
          userFriendlyMessage = 'Impossible de charger les données. Réessayez plus tard.';
          break;
        default:
          userFriendlyMessage = e.message ?? 'Une erreur est survenue lors du chargement';
      }
      
      return Left(ServerFailure(userFriendlyMessage));
    } catch (e) {
      return Left(ServerFailure('Un problème est survenu. Veuillez réessayer.'));
    }
  }
}