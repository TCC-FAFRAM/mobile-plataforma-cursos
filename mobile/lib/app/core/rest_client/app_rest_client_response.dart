final class AppRestClientResponse<T> {
  T? data;
  int? statusCode;
  String? statusMessage;
  String? eTag;
  AppRestClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
    this.eTag,
  });
}
