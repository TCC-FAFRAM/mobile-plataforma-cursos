import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app_module.dart';
import 'app/core/application_config.dart';

void main() async {
  await ApplicationConfig().configureApp([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const AppModule());
}

