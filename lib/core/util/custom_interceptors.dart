import 'package:dio/dio.dart';

import '../util/api_logger.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ApiLogger.logRequest(options.method ?? '', options.path, options.queryParameters ?? options.data);

    options.headers['Accept'] = 'application/json';

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ApiLogger.logResponse(response);
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    ApiLogger.logError(err);
    super.onError(err, handler);
  }
}