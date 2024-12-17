import 'package:flutter/material.dart';

import '../../../../../core/services/api_client.dart';
import '../../../../../core/util/api_response_exception.dart';
import '../../models/user_model.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSource({required this.apiClient});

  Future<UserModel?> login(Map<String, dynamic> body) async {
    try {
      final response = await apiClient.postRequest(
        path: "login",
        data: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['user'] == null) {
          throw ApiResponseException(message: 'No user data in response');
        }

        return UserModel.fromJson(response.data);
        //debugPrint(response.data.toString());
        
      } else {
        throw ApiResponseException(
          message: response.data['message'] ?? 'Failed to login',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw ApiResponseException(
        message: e is ApiResponseException
            ? e.message
            : 'An unexpected error occurred during login',
      );
    }
  }

  Future<bool> register(Map<String, dynamic> body) async {
    try {
      final response = await apiClient.postRequest(
        path: "register/tourist",
        data: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw ApiResponseException(
          message: response.data['message'] ?? 'Failed to register',
        );
      }
    } catch (e) {
      throw ApiResponseException(
          message: 'An error occurred during registration');
    }
  }
}
