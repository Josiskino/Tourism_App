import 'package:myapp/core/util/api_response.dart';
import 'package:myapp/features/auth/data/models/tourist_model.dart';
import 'package:myapp/features/auth/data/models/agency_model.dart';

import '../../../../../core/services/api_client.dart';
import '../../models/user_type.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSource({required this.apiClient});

    Future<ApiResponse<UserType>> login(Map<String, dynamic> body) async {
    final response = await apiClient.postRequest(
      path: "login",
      data: body,
    );

    final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;

    if (responseData['role'] == 'tourist') {
      return ApiResponse.success(
        UserType(
          userModel: TouristModel.fromJson(responseData['tourist']),
          userType: 'tourist',
        ),
      );
    } else if (responseData['role'] == 'agency') {
      return ApiResponse.success(
        UserType(
          userModel: AgencyModel.fromJson(responseData['agency']),
          userType: 'agency',
        ),
      );
    } else {
      return ApiResponse.error("Unknown user role", 400);
    }
  }

 Future<ApiResponse<void>> registerTourist(Map<String, dynamic> body) async {
    final response = await apiClient.postRequest(
      path: "register/tourist",
      data: body,
    );
    return ApiResponse<void>.fromResponse(response, (_) {});
  }

  Future<ApiResponse<void>> registerAgency(Map<String, dynamic> body) async {
    final response = await apiClient.postRequest(
      path: "register/agency",
      data: body,
    );
    return ApiResponse<void>.fromResponse(response, (_) {});
  }

}