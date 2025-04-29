import 'package:app/app/entities/models/curso.model.dart';
import 'package:bloc/bloc.dart';

import '../../core/logger/app_logger.dart';

import '../../dtos/pagination_dto.dart';
import '../../services/autenticacao/autenticacao_service.dart';
import '../../services/cursos/curso_service.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final AppLogger _logger;
  final CursoService _cursoService;
  final AutenticacaoService _autenticacaoService;

  String pesquisar = '';

  HomeController({
    required AppLogger logger,
    required CursoService cursoService,
    required AutenticacaoService autenticacaoService,
  })  : _logger = logger,
        _cursoService = cursoService,
        _autenticacaoService = autenticacaoService,
        super(
          const HomeState.initial(),
        );

  Future<void> initApp() async {
    await getUser();
    await getCursos(true);
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
      emit(state.copyWith(status: HomeStateStatus.loaded));
    } catch (e) {
      _logger.error('Erro ao buscar o usuario', e);
      emit(state.copyWith(
        status: HomeStateStatus.error,
        message: 'Erro ao buscar o usuario',
      ));
    }
  }

  Future<void> getCursos(bool reset) async {
    try {
      int pagina;
      List<CursoModel> newListView = [];

      if (reset) {
        pagina = 1;
        emit(state.copyWith(fecth: false, status: HomeStateStatus.loading));
      } else {
        pagina = state.pagina + 1;
        newListView = [...state.items];
        emit(state.copyWith(fecth: true));
      }

      var params = PaginationDTO(
        search: pesquisar,
        pagina: state.pagina,
      );

      var list = await _cursoService.list(params);

      newListView = [...newListView, ...list];

      emit(
        state.copyWith(
          items: newListView,
          pagina: pagina,
          fecth: false,
          status: HomeStateStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStateStatus.warning,
          message: 'Erro ao obter dados.',
        ),
      );
    }
  }
}
