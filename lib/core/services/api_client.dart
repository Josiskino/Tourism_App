import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constants/api_endpoint_urls.dart';
import '../util/api_exception.dart';

class ApiClient {
  final Dio dio;
  String? _authToken;

  ApiClient({required this.dio});

  void _logRequest(String method, String path, [Map<String, dynamic>? body]) {
    debugPrint("===========API $method REQUEST===========");
    debugPrint("REQUEST URL: ${dio.options.baseUrl + path}");
    if (body != null) {
      debugPrint("REQUEST BODY: ${body.toString()}");
    } else {
      debugPrint("REQUEST BODY: No body");
    }
  }

  void _logResponse(Response response) {
    debugPrint("===========API RESPONSE===========");
    debugPrint("RESPONSE STATUS CODE: ${response.statusCode}");
    debugPrint("RESPONSE DATA: ${response.data.toString()}");
  }

  void _handleError(DioException e) {
    if (e.response != null) {
      debugPrint(e.response!.data.toString());
      debugPrint(e.response!.headers.toString());
      debugPrint(e.response!.requestOptions.toString());
      throw ApiException(
        message: e.response!.statusMessage ?? 'Erreur inconnue',
      );
    } else {
      debugPrint(e.requestOptions.toString());
      debugPrint(e.message);
      debugPrint(e.type.toString());
      throw ApiException(message: e.message);
    }
  }

  void setAuthToken(String token) {
    _authToken = token;
  }

  Future<Response> getRequest({required String path}) async {
    final options = Options(
      headers: {
        'Authorization': _authToken != null ? 'Bearer $_authToken' : '',
      },
    );

    try {
      _logRequest("GET", path);
      final response = await dio.get(path, options: options);
      _logResponse(response);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> postRequest(
      {required String path, Map<String, dynamic>? data}) async {
    final options = Options(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': _authToken != null ? 'Bearer $_authToken' : '',
      },
    );

    try {
      // Log the request with dynamic body
      _logRequest("POST", path, data);
      final response = await dio.post(path, data: data, options: options);
      _logResponse(response);

      if (path.contains(ApiEndpointUrls.login)) {
        final token = response.data["token"];
        setAuthToken(token);
      }

      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }
}
