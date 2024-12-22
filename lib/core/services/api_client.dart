import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../init_dependancies.dart';
import '../abstract/local_storage/local_storage_service.dart';
import '../constants/api_endpoint_urls.dart';
import '../util/custom_interceptors.dart';
import '../util/network_exceptions.dart';
import 'local_storage_service.dart';

class ApiClient {
  final Dio dio;
  String? _authToken;

  //ApiClient({required this.dio});

  ApiClient({Dio? dio}) : dio = dio ?? Dio() {
    // Add interceptors to the Dio instance
    this.dio.interceptors.add(CustomInterceptors());

    // Optional: Configure base options
    // this.dio.options.connectTimeout = const Duration(seconds: 30);
    // this.dio.options.receiveTimeout = const Duration(seconds: 30);
  }

  void setAuthToken(String token) async {
    _authToken = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("auth_token", token);

    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearAuthToken() {
    _authToken = null;
    dio.options.headers.remove('Authorization');
  }

  Future<Response> getRequest(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? additionalHeaders}) async {
    final headers = {
      ...?additionalHeaders,
      //if (_authToken != null) 'Authorization': 'Bearer $_authToken',
    };

    final options = Options(headers: headers);
    print('JE suis dans mon ckient dio get');
    try {
      final response = await dio.get(path,
          queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Response> postRequest(
      {required String path,
      Map<String, dynamic>? data,
      Map<String, String>? additionalHeaders}) async {
    final token = await serviceLocator<LocalStorageService>().getToken();
    final headers = {
      'Content-Type': 'application/json',
      ...?additionalHeaders,
      //if (_authToken != null) 'Authorization': 'Bearer $_authToken',
       'Authorization': 'Bearer $token',
    };
    print('JE suis dans mon ckient dio post');
    final options = Options(headers: headers);

    try {
      print('JE suis avant le try de final response  dio post');
      final response = await dio.post(path, data: data, options: options);
      print('JE suis après le try de final response  dio post');
      // Specific handling for login
      if (path.contains(ApiEndpointUrls.login)) {
        final token = response.data["token"];
        setAuthToken(token);
      }

      return response;
    } on DioException catch (e) {
      print('JE suis dans le catch de final response  dio post');
      print(e);
      //_handleDioError(e);
      rethrow;
    } catch (e) {
      print('JE suis dans le catch de final response  dio post **************');
      print(e);
      rethrow;
    }
  }

  Future<Response> putRequest(
      {required String path,
      Map<String, dynamic>? data,
      Map<String, String>? additionalHeaders}) async {
    final headers = {
      'Content-Type': 'application/json',
      ...?additionalHeaders,
      if (_authToken != null) 'Authorization': 'Bearer $_authToken',
    };

    final options = Options(headers: headers);

    try {
      final response = await dio.put(path, data: data, options: options);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Response> deleteRequest(
      {required String path,
      Map<String, dynamic>? data,
      Map<String, String>? additionalHeaders}) async {
    final headers = {
      ...?additionalHeaders,
      if (_authToken != null) 'Authorization': 'Bearer $_authToken',
    };

    final options = Options(headers: headers);

    try {
      final response = await dio.delete(path, data: data, options: options);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Response> postMultipartRequest(
      {required String path,
      required FormData formData,
      Map<String, String>? additionalHeaders}) async {
    final headers = {
      ...?additionalHeaders,
      if (_authToken != null) 'Authorization': 'Bearer $_authToken',
    };

    final options = Options(headers: headers);

    try {
      final response = await dio.post(path, data: formData, options: options);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  void _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        throw const NetworkConnectionException();

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final errorMessage = e.response?.data?['message'] ?? 'Erreur inconnue';

        switch (statusCode) {
          case 400:
            throw BadRequestException(errorMessage);
          case 401:
            throw const UnauthorizedException();
          case 404:
            throw NotFoundException(errorMessage);
          case 500:
            throw ServerException(errorMessage);
          default:
            throw NetworkException(errorMessage, statusCode);
        }

      case DioExceptionType.cancel:
        throw const NetworkException('Requête annulée');

      case DioExceptionType.unknown:
        throw const NetworkConnectionException();
      case DioExceptionType.badCertificate:
        throw const BadCertificateException();
      case DioExceptionType.connectionError:
        throw const NetworkConnectionException();
    }
  }
}
