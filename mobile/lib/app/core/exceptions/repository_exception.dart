class RepositoryException implements Exception {
  final String? message;
  final dynamic error;
  final dynamic source;
  RepositoryException({
    this.message,
    this.error,
    this.source,
  });
}
