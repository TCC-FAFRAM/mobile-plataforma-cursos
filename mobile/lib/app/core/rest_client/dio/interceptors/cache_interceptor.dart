import 'package:dio/dio.dart';

import '../../../helpers/constants.dart';
import '../../../local_storage/app_local_storage.dart';
import '../../../logger/app_logger.dart';

final class CacheInterceptor extends Interceptor {
  final AppLogger _log;

  CacheInterceptor({
    required AppLogger log,
    required AppLocalStorage localStorage,
  }) : _log = log;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final forceUpdate = options.extra[Constants.ENV_REST_FORCE_UPDATE] ?? false;

    if (!forceUpdate) {
      final etag = options.extra[Constants.ENV_REST_ETAG_STORAGE] ?? '';

      if (etag != null) {
        options.headers[Constants.ENV_REST_ETAG_REQUEST] = etag;
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      final responseStatusCode = err.response?.statusCode ?? 0;

      if (responseStatusCode == 304) {
        _log.info(
          '################################ E-Tag (Not Modify) (${err.response}) #################################',
        );
      }
      super.onError(err, handler);
    } on DioException catch (err) {
      super.onError(err, handler);
    } catch (e, s) {
      _log.error('Error dio request', e, s);
      super.onError(err, handler);
    }
  }
}
