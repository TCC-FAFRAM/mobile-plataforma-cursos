import 'package:bloc/bloc.dart';

import '../../core/logger/app_logger.dart';
import '../../entities/usuario.dart';
import '../../services/autenticacao/autenticacao_service.dart';
import 'create_state.dart';

class CreateController extends Cubit<CreateState> {
  final AppLogger _logger;
  final AutenticacaoService _autenticacaoService;

  CreateController({
    required AppLogger logger,
    required AutenticacaoService autenticacaoService,
  })  : _logger = logger,
        _autenticacaoService = autenticacaoService,
        super(
          const CreateState.initial(),
        );

  Future<void> create(String email, senha, nome, sobrenome) async {
    try {
      emit(state.copyWith(status: CreateStateStatus.loading));
      var usuarios =
          Usuario(email: email, senha: senha, nome: nome, sobreNome: sobrenome);
      await _autenticacaoService.createUser(usuarios);

      emit(state.copyWith(
        status: CreateStateStatus.sucess,
        message: "Usuario Criado com Sucesso!",
      ));
    } catch (e, stackTrace) {
      // Logando erro inesperado (caso haja um erro que não seja ServiceException)
      _logger.error("Erro inesperado no login", e, stackTrace);

      emit(state.copyWith(
        status: CreateStateStatus.error,
        message: "Ocorreu um erro inesperado. Tente novamente mais tarde.",
      ));
    }
  }
}
