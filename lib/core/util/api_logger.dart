import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiLogger {
  static void logRequest(String method, String path, [Map<String, dynamic>? data]) {
    if (kDebugMode) {
      debugPrint("===========API $method REQUEST===========");
      debugPrint("REQUEST URL: $path");
      if (data != null) {
        debugPrint("REQUEST BODY: ${data.toString() ?? {}}");
      } else {
        debugPrint("REQUEST BODY: No body");
      }
    }
  }

  static void logResponse(Response response) {
    if (kDebugMode) {
      debugPrint("===========API RESPONSE===========");
      debugPrint("RESPONSE STATUS CODE: ${response.statusCode}");
      debugPrint("RESPONSE DATA: ${response.data}");
    }
  }

  static void logError(dynamic error) {
    if (kDebugMode) {
      if (error is DioException) {
        debugPrint("===========API ERROR===========");
        debugPrint("ERROR TYPE: ${error.type}");
        debugPrint("ERROR MESSAGE: ${error.message}");
        
        if (error.response != null) {
          debugPrint("RESPONSE STATUS CODE: ${error.response?.statusCode}");
          debugPrint("RESPONSE DATA: ${error.response?.data}");
        }
      } else {
        debugPrint("Unexpected error: $error");
      }
    }
  }
}