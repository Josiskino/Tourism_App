enum HttpStatusCode {
  ok(200),
  created(201),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  serverError(500);

  final int code;
  const HttpStatusCode(this.code);

  bool get isSuccess => code >= 200 && code < 300;
}