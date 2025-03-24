import 'package:provider/provider.dart';

import '../../core/base_modules/base_module.dart';

import '../../core/utils/app_routers.dart';

import 'aula_controller.dart';
import 'aula_page.dart';

final class AulaModule extends BaseModule {
  AulaModule()
      : super(
          bindings: [
            Provider(
              create: (context) => AulaController(),
            ),
          ],
          routers: {
            AppRouters.curso: (context) => const AulaPage(),
          },
        );
}
