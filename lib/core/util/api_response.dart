import 'package:dio/dio.dart';

class ApiResponse<T> {
  final T? data;
  final String? message;
  final int? statusCode;
  final bool success;

  ApiResponse.success(this.data)
      : message = null,
        statusCode = 200,
        success = true;

  ApiResponse.error(this.message, this.statusCode)
      : data = null,
        success = false;

  factory ApiResponse.fromResponse(
    Response response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final statusCode = response.statusCode;
    final data = response.data;

    if (data is Map<String, dynamic> &&
        statusCode != null &&
        (statusCode >= 200 && statusCode < 300)) {
      return ApiResponse.success(fromJson(data));
    } else if (data is Map<String, dynamic>) {
      final message =
          data['status_message'] ?? _getMessageForStatusCode(statusCode ?? 500);
      return ApiResponse.error(message, statusCode);
    } else {
      return ApiResponse.error('Unknown error', statusCode);
    }
  }

  static String? _getMessageForStatusCode(int statusCode) {
    switch (statusCode) {
      case 200:
      case 201:
        return 'Request successful';
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 409:
        return 'Conflict';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      case 503:
        return 'Service unavailable';
      case 504:
        return 'Gateway timeout';
      default:
        return 'Unknown error';
    }
  }
}
