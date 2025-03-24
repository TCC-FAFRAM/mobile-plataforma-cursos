import 'package:app/app/pages/aula/aula_module.dart';
import 'package:app/app/pages/home/home_module.dart';
import 'package:app/app/pages/login/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/ui/theme/theme/ultramarine_light.dart';
import 'pages/create/create_module.dart';
import 'pages/cuerso_detalhe/curso_detalhe_module.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP',
      debugShowCheckedModeBanner: false,
      theme: UltramarineLightTheme().theme,
      //   darkTheme: ThemeData.dark(), // Tema escuro
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      routes: {
        ...HomeModule().routers,
        ...CursoDetalheModule().routers,
        ...AulaModule().routers,
        ...CreateModule().routers
      },
      home: LoginPage(),
    );
  }
}
