import 'package:provider/provider.dart';

import '../../core/base_modules/base_module.dart';

import '../../core/utils/app_routers.dart';
import 'create_controller.dart';
import 'create_page.dart';

final class CreateModule extends BaseModule {
  CreateModule()
      : super(
          bindings: [
            Provider(
              create: (context) => CreateController(
                  autenticacaoService: context.read(), logger: context.read()),
            ),
          ],
          routers: {
            AppRouters.register: (context) => const CreatePage(),
          },
        );
}
