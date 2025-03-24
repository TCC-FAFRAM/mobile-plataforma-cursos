import 'package:app/app/dtos/home/tipo_filtro_token_dto.dart';

import '../../entities/usuario.dart';
import '../../models/usuario/autenticacao_model.dart';

abstract interface class AutenticacaoService {
  Future<AutenticacaoModel?> login(String username, String password);
  Future<void> refreshToken();
  Future<String> nameUser();
  Future<String> tipoUser();
  Future<String> emailUser();
  Future<bool> isExpiredToken(TipoFiltroTokenDTO tipoToken);
  Future<void> createUser(Usuario usuario);
  Future<void> logout();
}
