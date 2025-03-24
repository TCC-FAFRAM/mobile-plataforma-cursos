import '../../core/exceptions/service_exception.dart';
import '../../core/helpers/constants.dart';
import '../../core/jwt/app_jwt.dart';
import '../../core/local_storage/app_local_storage.dart';
import '../../core/logger/app_logger.dart';
import './splash_service.dart';

class SplashServiceImpl implements SplashService {
  final AppLocalStorage _localStorage;
  final AppLogger _logger;
  final AppJwt _jwt;
  SplashServiceImpl({
    required AppLocalStorage localStorage,
    required AppLogger logger,
    required AppJwt jwt,
  })  : _localStorage = localStorage,
        _logger = logger,
        _jwt = jwt;

  @override
  Future<bool> isExpiredAccessToken() async {
    try {
      final token =
          await _localStorage.read(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY);
      return _jwt.isExpired(token);
    } catch (e, s) {
      String mensagem = 'Erro ao tentar validar se o token estava expirado';
      _logger.error(mensagem, e, s);
      throw ServiceException(message: mensagem);
    }
  }
}
