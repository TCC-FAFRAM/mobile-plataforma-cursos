import 'package:dio/dio.dart';

import '../../../connectivity/app_connectivity.dart';
import '../../../helpers/constants.dart';
import '../../../local_storage/app_local_storage.dart';

final class AuthInterceptor extends Interceptor {
  final AppLocalStorage _localStorage;
  final AppConnectivity _connectivity;

  AuthInterceptor({
    required AppLocalStorage localStorage,
    required AppConnectivity connectivity,
  })  : _localStorage = localStorage,
        _connectivity = connectivity;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    bool connection = await _checkConnection();

    if (!connection) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: 'Seu dispositivo está sem conexão com a internet.',
          type: DioExceptionType.cancel,
        ),
      );
    }

    final authRequired =
        options.extra[Constants.ENV_REST_AUTH_REQUIRED_KEY] ?? false;

    if (authRequired) {
      final accessToken = await _localStorage
          .read<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY);
      if (accessToken == null) {
        // await GlobalContext.instance.loginExpire();
        return handler.reject(
          DioException(
            requestOptions: options,
            error: 'Expired Token',
            type: DioExceptionType.cancel,
          ),
        );
      }
      options.headers['Authorization'] = 'Bearer $accessToken';
    } else {
      options.headers.remove('Authorization');
    }
    super.onRequest(options, handler);
  }

  Future<bool> _checkConnection() async {
    final connectivity = await _connectivity.checkConnect();
    return connectivity == AppConnectivityStatus.connected;
  }
}
