import 'package:dio/dio.dart';

import '../../../exceptions/authenticate/expired_token_exception.dart';
import '../../../global/global_context.dart';
import '../../../helpers/constants.dart';
import '../../../local_storage/app_local_storage.dart';
import '../../../logger/app_logger.dart';
import '../../app_rest_client.dart';

final class AuthRefreshTokenInterceptor extends Interceptor {
  final AppLocalStorage _localStorage;
//  final AppLocalSecureStorage _localSecureStorage;
  final AppRestClient _restClient;
  final AppLogger _log;

  final String _routeRefreshToken = '/usuario/refreshtoken/';
  final String _accessToken = 'accessToken';
  final String _refreshToken = 'refreshToken/';

  AuthRefreshTokenInterceptor({
    required AppLocalStorage localStorage,
    //   required AppLocalSecureStorage localSecureStorage,
    required AppRestClient restClient,
    required AppLogger log,
  })  : _localStorage = localStorage,
        //  _localSecureStorage = localSecureStorage,
        _restClient = restClient,
        _log = log;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      final responseStatusCode = err.response?.statusCode ?? 0;
      final reqPath = err.requestOptions.path;

      if (responseStatusCode == 403 || responseStatusCode == 401) {
        if (reqPath != _routeRefreshToken) {
          final authRequired =
              err.requestOptions.extra[Constants.ENV_REST_AUTH_REQUIRED_KEY] ??
                  false;
          if (authRequired) {
            _log.info(
                '################################ Refresh Token (${err.requestOptions.path}) #################################');
            await _tryRefreshToken(err);
            await _retryRequest(err, handler);
          } else {
            throw err;
          }
        } else {
          throw err;
        }
      } else {
        super.onError(err, handler);
      }
    } on ExpiredTokenException {
      await GlobalContext.instance.loginExpire();
    } on DioException catch (e) {
      handler.next(e);
    } catch (e, s) {
      _log.error('Error dio request', e, s);
      handler.next(err);
    }
  }

  Future<void> _tryRefreshToken(DioException err) async {
    // final refreshToken = await _localSecureStorage
    //     .read(Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY);

    // if (refreshToken == null) {
    //   throw ExpiredTokenException();
    // }

    // final resultRefresh = await _restClient.auth().put(
    //   _routeRefreshToken,
    //   data: {
    //     _refreshToken: refreshToken,
    //   },
    // );

    // await _localStorage.write<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY,
    //     resultRefresh.data[_accessToken]);

    // await _localSecureStorage.write(Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY,
    //     resultRefresh.data[_refreshToken]);
  }

  Future<void> _retryRequest(
      DioException err, ErrorInterceptorHandler handler) async {
    _log.append(
        "################################ Retry Request (${err.requestOptions.path}) #################################");
    final requestOptions = err.requestOptions;

    final result = await _restClient.request(
      requestOptions.path,
      method: requestOptions.method,
      data: requestOptions.data,
      headers: requestOptions.headers,
      queryParameters: requestOptions.queryParameters,
    );

    handler.resolve(
      Response(
        requestOptions: requestOptions,
        data: result.data,
        statusCode: result.statusCode,
        statusMessage: result.statusMessage,
      ),
    );
  }
}
