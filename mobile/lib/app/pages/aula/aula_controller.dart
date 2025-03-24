import 'package:bloc/bloc.dart';

import 'aula_state.dart';

class AulaController extends Cubit<AulaState> {
  AulaController()
      : super(
          const AulaState.initial(),
        );

  Future<void> initApp() async {}
}
