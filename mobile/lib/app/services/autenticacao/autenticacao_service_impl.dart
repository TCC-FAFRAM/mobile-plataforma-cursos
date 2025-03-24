import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/service_exception.dart';
import '../../core/helpers/constants.dart';
import '../../core/jwt/app_jwt.dart';
import '../../core/local_storage/app_local_storage.dart';
import '../../core/logger/app_logger.dart';
import '../../dtos/home/tipo_filtro_token_dto.dart';
import '../../entities/usuario.dart';
import '../../models/usuario/autenticacao_model.dart';
import '../../repositories/autenticacao/autenticacao_repository.dart';
import './autenticacao_service.dart';

final class AutenticacaoServiceImpl implements AutenticacaoService {
  final AutenticacaoRepository _repository;
  final AppLocalStorage _localStorage;
  final AppLocalSecureStorage _localSecureStorage;
  final AppLogger _logger;
  final AppJwt _jwt;

  AutenticacaoServiceImpl({
    required AutenticacaoRepository repository,
    required AppLocalStorage localStorage,
    required AppLocalSecureStorage localSecureStorage,
    required AppLogger logger,
    required AppJwt jwt,
  })  : _repository = repository,
        _localStorage = localStorage,
        _localSecureStorage = localSecureStorage,
        _logger = logger,
        _jwt = jwt;

  @override
  Future<AutenticacaoModel?> login(String username, String password) async {
    try {
      var autenticacao =
          await _repository.login(username.trim(), password.trim());

      await _saveToken(autenticacao: autenticacao, username: username);

      return autenticacao;
    } on RepositoryException catch (e) {
      _logger.error('Erro no repositório', e);
      throw ServiceException(message: e.message);
    } catch (e) {
      _logger.error('Erro desconhecido', e);
      throw ServiceException(message: e.toString());
    }
  }

  @override
  Future<bool> isExpiredToken(TipoFiltroTokenDTO tipoToken) async {
    try {
      final token = await _getToken(tipoToken);

      return _jwt.isExpired(token);
    } catch (e, s) {
      _logger.error('Erro no serviço de autenticação', e, s);
      throw ServiceException();
    }
  }

  Future<String> _getToken(TipoFiltroTokenDTO tipoToken) async {
    switch (tipoToken) {
      case TipoFiltroTokenDTO.accessToken:
        return await _localStorage.read(tipoToken.keyValue) ?? '';
      case TipoFiltroTokenDTO.refreshToken:
        return await _localSecureStorage.read(tipoToken.keyValue) ?? '';
    }
  }

  Future<void> _saveToken({
    AutenticacaoModel? autenticacao,
    String? username,
  }) async {
    if (autenticacao?.accessToken != null) {
      await _localStorage.write<String>(
        Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY,
        autenticacao!.accessToken,
      );
      await _localSecureStorage.write(
        Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY,
        autenticacao.refreshToken,
      );

      await _localStorage.write<String>(
          Constants.LOCAL_USUARIO_TIPO, autenticacao.user.tipo ?? 'USER');

      await _localStorage.write<String>(
          Constants.LOCAL_USUARIO_EMAIL, autenticacao.user.email);
      await _localStorage.write<String>(
          Constants.LOCAL_USUARIO_NOME, autenticacao.user.nome);
    }
  }

  @override
  Future<String> nameUser() async {
    try {
      return await _localStorage.read<String>(Constants.LOCAL_USUARIO_NOME) ??
          '';
    } catch (e) {
      throw ServiceException();
    }
  }

  @override
  Future<String> emailUser() async {
    try {
      return await _localStorage.read<String>(Constants.LOCAL_USUARIO_EMAIL) ??
          '';
    } catch (e) {
      throw ServiceException();
    }
  }

  @override
  Future<String> tipoUser() async {
    try {
      return await _localStorage.read<String>(Constants.LOCAL_USUARIO_TIPO) ??
          'USER';
    } catch (e) {
      throw ServiceException();
    }
  }

  @override
  Future<void> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    try {
      await _localStorage.clear();
      await _localSecureStorage.clear();
    } catch (e) {
      throw ServiceException();
    }
  }

  @override
  Future<void> createUser(Usuario usuario) async {
    try {
      await _repository.create(usuario);
    } catch (e) {
      throw ServiceException();
    }
  }
}
