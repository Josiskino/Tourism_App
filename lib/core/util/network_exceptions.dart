class NetworkException implements Exception {
  final String message;
  final int? statusCode;

  const NetworkException(this.message, [this.statusCode]);

  @override
  String toString() => 'NetworkException: $message';
}

class UnauthorizedException extends NetworkException {
  const UnauthorizedException() : super('Non autorisé', 401);
}

class NetworkConnectionException extends NetworkException {
  const NetworkConnectionException() : super('Problème de connexion');
}

class BadRequestException extends NetworkException {
  const BadRequestException(String message) : super(message, 400);
}

class NotFoundException extends NetworkException {
  const NotFoundException(String message) : super(message, 404);
}

class ServerException extends NetworkException {
  const ServerException(String message) : super(message, 500);
}

class BadCertificateException extends NetworkException {
  const BadCertificateException() : super('Certificat invalide', 495);
}

