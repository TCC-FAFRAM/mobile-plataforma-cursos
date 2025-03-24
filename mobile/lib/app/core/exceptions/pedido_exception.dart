class PedidoException implements Exception {
  final String? message;
  final dynamic error;
  final dynamic source;

  PedidoException({this.message, this.error, this.source});
}
