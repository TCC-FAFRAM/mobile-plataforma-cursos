import 'package:bloc/bloc.dart';

import '../../core/logger/app_logger.dart';

import '../../services/autenticacao/autenticacao_service.dart';
import '../../services/home/home_service.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final AppLogger _logger;
  final HomeService _homeService;
  final AutenticacaoService _autenticacaoService;

  HomeController({
    required AppLogger logger,
    required HomeService homeService,
    required AutenticacaoService autenticacaoService,
  })  : _logger = logger,
        _homeService = homeService,
        _autenticacaoService = autenticacaoService,
        super(
          const HomeState.initial(),
        );

  Future<void> initApp() async {
    await getUser();
  }

  Future<void> logout() async {
    await _autenticacaoService.logout();
  }

  Future<void> getUser() async {
    try {
      emit(state.copyWith(status: HomeStateStatus.loading));
      var nome = await _autenticacaoService.nameUser();
      var email = await _autenticacaoService.emailUser();
      var tipo = await _autenticacaoService.tipoUser();
      emit(state.copyWith(name: nome, email: email, tipoUser: tipo));
    } catch (e) {
      _logger.error('Erro ao buscar o usuario', e);
      emit(state.copyWith(
        status: HomeStateStatus.error,
        message: 'Erro ao buscar o usuario',
      ));
    }
  }
}
