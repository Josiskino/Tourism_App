import '../../../../../core/services/api_client.dart';
import '../../../../../core/util/api_response_exception.dart';
import '../../models/category_model.dart';
import '../../models/tourism_site_model.dart';

class HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSource({required this.apiClient});

  Future<({
    List<CategoryModel> categories, 
    List<TourismSiteModel> recentSites
  })> getHomePageData() async {
    try {
      final response = await apiClient.getRequest(
        path: "home", 
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        
        if (response.data == null) {
          throw ApiResponseException(message: 'Aucune donnée de page d\'accueil');
        }

        
        final categoriesJson = response.data['categories'] as List;
        final categories = categoriesJson
            .map((categoryJson) => CategoryModel.fromJson(categoryJson))
            .toList();

        
        final recentSitesJson = response.data['recent_sites'] as List;
        final recentSites = recentSitesJson
            .map((siteJson) => TourismSiteModel.fromJson(siteJson))
            .toList();

        return (
          categories: categories,
          recentSites: recentSites
        );
      } else {
        throw ApiResponseException(
          message: response.data['message'] ?? 'Échec du chargement des données',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw ApiResponseException(
        message: e is ApiResponseException
            ? e.message
            : 'Une erreur inattendue s\'est produite lors du chargement des données',
      );
    }
  }
}