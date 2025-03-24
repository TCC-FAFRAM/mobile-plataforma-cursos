import 'package:bloc/bloc.dart';

import '../../core/exceptions/service_exception.dart';
import '../../core/logger/app_logger.dart';

import '../../dtos/home/tipo_filtro_token_dto.dart';
import '../../services/autenticacao/autenticacao_service.dart';
import 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AppLogger _logger;
  final AutenticacaoService _autenticacaoService;

  LoginController({
    required AppLogger logger,
    required AutenticacaoService autenticacaoService,
  })  : _logger = logger,
        _autenticacaoService = autenticacaoService,
        super(
          const LoginState.initial(),
        );

  Future<void> initApp() async {
    try {
      emit(state.copyWith(status: LoginStateStatus.loading));
      var validacao = await _autenticacaoService
          .isExpiredToken(TipoFiltroTokenDTO.accessToken);
      if (!validacao) {
        var tipo = await _autenticacaoService.tipoUser();
        emit(state.copyWith(
          status: LoginStateStatus.typeUser,
          user: tipo,
        ));
      } else {
        emit(state.copyWith(
          status: LoginStateStatus.warning,
          message: "Usuario Não Authentificado!",
        ));
      }
    } catch (e) {
      _logger.error('Erro ao inicializar o app', e);
      emit(state.copyWith(
        status: LoginStateStatus.warning,
        message: 'Usuario Não Authentificado!',
      ));
    }
  }

  Future<void> login(String email, senha) async {
    try {
      emit(state.copyWith(status: LoginStateStatus.loading));
      var usuario = await _autenticacaoService.login(email, senha);

      emit(state.copyWith(
        status: LoginStateStatus.typeUser,
        user: usuario?.user.tipo,
      ));
    } on ServiceException catch (e) {
      emit(state.copyWith(
        status: LoginStateStatus.warning,
        message: e.message ?? "Erro desconhecido ao tentar autenticar",
      ));
    } catch (e, stackTrace) {
      // Logando erro inesperado (caso haja um erro que não seja ServiceException)
      _logger.error("Erro inesperado no login", e, stackTrace);

      emit(state.copyWith(
        status: LoginStateStatus.error,
        message: "Ocorreu um erro inesperado. Tente novamente mais tarde.",
      ));
    }
  }
}
