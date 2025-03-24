import '../../core/exceptions/repository_exception.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/app_rest_client.dart';
import '../../core/rest_client/app_rest_client_exception.dart';
import '../../core/utils/app_routers_remote.dart';
import '../../entities/usuario.dart';
import '../../models/usuario/autenticacao_model.dart';
import './autenticacao_repository.dart';

class AutenticacaoRepositoryImpl implements AutenticacaoRepository {
  final AppRestClient _restClient;
  final AppLogger _logger;

  AutenticacaoRepositoryImpl({
    required AppRestClient restClient,
    required AppLogger logger,
  })  : _restClient = restClient,
        _logger = logger;

  @override
  Future<AutenticacaoModel?> login(String username, String password) async {
    try {
      var result = await _restClient.unAuth().post(
        AppRoutersRemote.usuarioLogin,
        data: {
          "email": username.toString(),
          "senha": password.toString(),
        },
      );

      return AutenticacaoModel.fromMap(result.data);
    } on AppRestClientException catch (e) {
      _logger.error(e, e.toString());

      if (e.statusCode == 401 || e.statusCode == 400) {
        if (e.response.data != null &&
            e.response.data is Map<String, dynamic>) {
          String errorMessage = e.response.data["error"] ?? "Erro desconhecido";
          throw RepositoryException(
              message: "Falha na autenticação - $errorMessage");
        }
      }

      throw RepositoryException(message: e.message ?? "Erro inesperado");
    } catch (e) {
      _logger.error(e, e.toString());
      throw RepositoryException(message: e.toString());
    }
  }

  @override
  Future<void> create(Usuario usuario) async {
    try {
      await _restClient.unAuth().post(
        AppRoutersRemote.usuarioCreate,
        data: {
          "email": usuario.email.toString(),
          "senha": usuario.senha.toString(),
          "nome": usuario.nome.toString(),
          "sobre_nome": usuario.sobreNome.toString(),
          "tipo": "USER",
        },
      );
    } on Exception catch (e, s) {
      throw RepositoryException(error: e, source: s);
    }
  }
}
