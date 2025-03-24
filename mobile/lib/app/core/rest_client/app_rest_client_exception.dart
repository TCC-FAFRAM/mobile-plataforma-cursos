import 'app_rest_client_response.dart';

final class AppRestClientException implements Exception {
  String? message;
  int? statusCode;
  dynamic error;
  AppRestClientResponse response;

  AppRestClientException({
    this.message,
    this.statusCode,
    required this.error,
    required this.response,
  });

  @override
  String toString() {
    return 'RestClientException(message: $message, statusCode: $statusCode, error: $error, response: $response)';
  }
}
