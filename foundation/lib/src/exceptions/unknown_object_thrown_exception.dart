class UnknownObjectThrownException implements Exception {
  final Object? object;
  final String? message;

  UnknownObjectThrownException({this.message, this.object});
}
