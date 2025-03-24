import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';
import 'core/cubit/date_cubit.dart';
import 'core/providers/application_bindings.dart';

import 'pages/login/login_controller.dart';
import 'providers/splash/splash_service_provider.dart';
import 'repositories/autenticacao/autenticacao_repository.dart';
import 'repositories/autenticacao/autenticacao_repository_impl.dart';
import 'services/autenticacao/autenticacao_service.dart';
import 'services/autenticacao/autenticacao_service_impl.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...applicationBindings,
        ...splashProviderService,
        Provider<DateCubit>(create: (_) => DateCubit()),
        Provider<AutenticacaoRepository>(
            create: (context) => AutenticacaoRepositoryImpl(
                restClient: context.read(), logger: context.read())),
        Provider<AutenticacaoService>(
          create: (context) => AutenticacaoServiceImpl(
              repository: context.read(),
              localStorage: context.read(),
              localSecureStorage: context.read(),
              logger: context.read(),
              jwt: context.read()),
        ),
        Provider(
          create: (context) => LoginController(
              logger: context.read(), autenticacaoService: context.read()),
        ),
      ],
      child: const AppWidget(),
    );
  }
}
