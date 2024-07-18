class Failure {
  final String message;
  Failure([this.message = 'An unexpected error occurred']);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}
