import '../../../../../core/services/api_client.dart';
import '../../../../../core/util/api_response_exception.dart';
import '../../../../../features/reservation/data/models/reservation_model.dart';

class ReservationDataSource {
  final ApiClient apiClient;
  
  const ReservationDataSource({required this.apiClient});

  // Créer une réservation
  Future<ReservationModel> createReservation(Map<String, dynamic> data) async {
    try {
      final response = await apiClient.postRequest(
        path: "reservations",
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['reservation'] == null) {
          throw ApiResponseException(
            message: 'Aucune donnée de réservation dans la réponse',
          );
        }

        return ReservationModel.fromJson(response.data['reservation']);
      } else {
        throw ApiResponseException(
          message: response.data['message'] ?? 'Échec de création de réservation',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  // Récupérer toutes les réservations
  Future<List<ReservationModel>> getAllReservations() async {
    try {
      final response = await apiClient.getRequest(
        path: "reservations",
      );

      if (response.statusCode == 200) {
        final List<dynamic> reservationsData = response.data['data'];
        return reservationsData
            .map((reservationJson) => ReservationModel.fromJson(reservationJson))
            .toList();
      } else {
        throw ApiResponseException(
          message: response.data['message'] ?? 'Échec de récupération des réservations',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  // Annuler une réservation
  // Future<void> cancelReservation(int reservationId) async {
  //   try {
  //     final response = await apiClient.patchRequest(
  //       path: "reservations/$reservationId/cancel",
  //     );

  //     if (response.statusCode != 200) {
  //       throw ApiResponseException(
  //         message: response.data['message'] ?? 'Échec de l\'annulation de la réservation',
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}