class ServiceException implements Exception {
  final String? message;
  final dynamic error;
  final dynamic source;
  ServiceException({
    this.message,
    this.error,
    this.source,
  });
}
