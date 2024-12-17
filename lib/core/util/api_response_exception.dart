class ApiResponseException implements Exception {
  final dynamic message;
  final int? statusCode;

  ApiResponseException({required this.message, this.statusCode});

  @override
  String toString() {
    if (message is String) {
      //return 'Error: $message';
      return '$message';
    }
    // return 'Error: $message, Status Code: $statusCode';
    return '$message, $statusCode';
  }
}