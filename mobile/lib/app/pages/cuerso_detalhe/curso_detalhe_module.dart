import 'package:provider/provider.dart';

import '../../core/base_modules/base_module.dart';

import '../../core/utils/app_routers.dart';

import 'curso_detalhe_controller.dart';
import 'curso_detalhe_page.dart';

final class CursoDetalheModule extends BaseModule {
  CursoDetalheModule()
      : super(
          bindings: [
            Provider(
              create: (context) => CursoDetalheController(),
            ),
          ],
          routers: {
            AppRouters.cursoDetalhe: (context) => const CursoDetalhePage(),
          },
        );
}
