import 'package:bloc/bloc.dart';

import 'curso_detalhe_state.dart';

class CursoDetalheController extends Cubit<CursoDetalheState> {
  CursoDetalheController()
      : super(
          const CursoDetalheState.initial(),
        );

  Future<void> initApp() async {}
}
