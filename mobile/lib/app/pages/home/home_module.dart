import 'package:provider/provider.dart';

import '../../core/base_modules/base_module.dart';
import '../../core/utils/app_routers.dart';

import '../../providers/home/home_service_provider.dart';
import 'home_controller.dart';
import 'home_page.dart';

final class HomeModule extends BaseModule {
  HomeModule()
      : super(
          bindings: [
            ...homeServiceProvider,
            Provider(
              create: (context) => HomeController(
                logger: context.read(),
                homeService: context.read(),
                autenticacaoService: context.read(),
              ),
            ),
          ],
          routers: {
            AppRouters.home: (context) => const HomePage(),
          },
        );
}
