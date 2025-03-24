import '../../entities/usuario.dart';
import '../../models/usuario/autenticacao_model.dart';

abstract interface class AutenticacaoRepository {
  Future<AutenticacaoModel?> login(String username, String password);
  Future<void> create(Usuario usuario);
  // Future<void> changeUserOrServer();
  // Future<bool> firstAccess();
}
