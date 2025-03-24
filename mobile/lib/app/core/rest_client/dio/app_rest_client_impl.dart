import 'dart:convert';

import 'package:dio/dio.dart';

import '../../connectivity/app_connectivity.dart';
import '../../helpers/constants.dart';
import '../../helpers/environments.dart';
import '../../local_storage/app_local_storage.dart';
import '../../logger/app_logger.dart';
import '../app_rest_client.dart';
import '../app_rest_client_exception.dart';
import '../app_rest_client_response.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/auth_refresh_token_interceptor.dart';
import 'interceptors/cache_interceptor.dart';

final class AppRestClientImpl implements AppRestClient {
  late final Dio _dio;

  final _defaultOptions = BaseOptions(
    baseUrl: Environments.instance.param(Constants.ENV_REST_BASE_URL_KEY) ?? '',
    connectTimeout: Duration(
      milliseconds: int.parse(
        Environments.instance
                .param(Constants.ENV_REST_CLIENT_CONNECT_TIMEOUT) ??
            '60000',
      ),
    ),
    receiveTimeout: Duration(
      milliseconds: int.parse(
        Environments.instance
                .param(Constants.ENV_REST_CLIENT_RECEIVE_TIMEOUT) ??
            '60000',
      ),
    ),
  );

  AppRestClientImpl({
    required AppLocalStorage localStorage,
    required AppLocalSecureStorage localSecureStorage,
    required AppLogger log,
    required AppConnectivity connectivity,
    BaseOptions? baseOptions,
  }) {
    _dio = Dio(baseOptions ?? _defaultOptions);
    _dio.interceptors.addAll([
      AuthInterceptor(
        localStorage: localStorage,
        connectivity: connectivity,
        //authStore: authStore,
      ),
      CacheInterceptor(
        log: log,
        localStorage: localStorage,
      ),
      AuthRefreshTokenInterceptor(
        //authStore: authStore,
        localStorage: localStorage,
        //  localSecureStorage: localSecureStorage,
        restClient: this,
        log: log,
      ),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    ]);
  }

  @override
  AppRestClient auth() {
    _defaultOptions.extra[Constants.ENV_REST_AUTH_REQUIRED_KEY] = true;
    _defaultOptions.extra[Constants.ENV_REST_FORCE_UPDATE] = false;
    return this;
  }

  @override
  AppRestClient unAuth() {
    _defaultOptions.extra[Constants.ENV_REST_AUTH_REQUIRED_KEY] = false;
    _defaultOptions.extra[Constants.ENV_REST_FORCE_UPDATE] = false;
    return this;
  }

  @override
  AppRestClient forceUpdate() {
    _defaultOptions.extra[Constants.ENV_REST_FORCE_UPDATE] = true;
    return this;
  }

  @override
  AppRestClient eTag(String value) {
    _defaultOptions.extra[Constants.ENV_REST_ETAG_STORAGE] = value;
    return this;
  }

  @override
  Future<AppRestClientResponse<T>> delete<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverte(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<AppRestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverte(response);
    } on DioException catch (e) {
      if (e.response?.statusCode != 304) {
        _throwRestClientException(e);
      }
      return AppRestClientResponse<T>(
        data: e.response?.data ?? [],
        statusCode: e.response?.statusCode,
        statusMessage: e.response?.statusMessage,
      );
    }
  }

  @override
  Future<AppRestClientResponse<Uint8List>> getStream<Uint8List>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      _dio.options.responseType = ResponseType.bytes;
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      _dio.options.responseType = ResponseType.json;
      return _dioResponseConverte(response);
    } on DioException catch (e) {
      _dio.options.responseType = ResponseType.json;
      if (e.response?.statusCode != 304) {
        _throwRestClientException(e);
      }
      return AppRestClientResponse<Uint8List>(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        statusMessage: e.response?.statusMessage,
      );
    }
  }

  @override
  Future<AppRestClientResponse<T>> patch<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverte(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<AppRestClientResponse<T>> post<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverte(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<AppRestClientResponse<T>> put<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverte(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<AppRestClientResponse<T>> request<T>(String path,
      {required String method,
      data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
      );

      return _dioResponseConverte(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  // Future<AppRestClientResponse<T>> _dioResponseConverte<T>(
  //     Response<dynamic> response) async {
  //   dynamic data = response.data;

  //   // Verifica se é uma lista e se contém apenas um objeto vazio
  //   if (data is List && data.isNotEmpty && data.every((item) => item == {})) {
  //     data = []; // Substitui por uma lista vazia
  //   }

  //   return AppRestClientResponse<T>(
  //     data: data,
  //     statusCode: response.statusCode,
  //     statusMessage: response.statusMessage,
  //     eTag: response.headers[Constants.ENV_REST_ETAG_RESPONSE_HEADER]?.first,
  //   );
  // }

  Future<AppRestClientResponse<T>> _dioResponseConverte<T>(
      Response<dynamic> response) async {
    dynamic data = response.data;

    // Verifica se o dado é uma string e tenta decodificar como JSON
    if (data is String) {
      try {
        data = jsonDecode(data);
      } catch (e) {
        // Caso a decodificação falhe, lança uma exceção
        throw AppRestClientException(
          error: e,
          message: "Erro ao decodificar a resposta como JSON",
          statusCode: response.statusCode,
          response: AppRestClientResponse(
            data: data,
            statusCode: response.statusCode,
            statusMessage: response.statusMessage,
          ),
        );
      }
    }

    return AppRestClientResponse<T>(
      data: data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      eTag: response.headers[Constants.ENV_REST_ETAG_RESPONSE_HEADER]?.first,
    );
  }

  Never _throwRestClientException(DioException dioError) {
    final response = dioError.response;

    throw AppRestClientException(
      error: dioError.error,
      message: response?.statusMessage,
      statusCode: response?.statusCode,
      response: AppRestClientResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
        eTag: response?.headers[Constants.ENV_REST_ETAG_RESPONSE_HEADER]?.first,
      ),
    );
  }
}
