import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'helpers/environments.dart';
import 'ui/styles/app_colors.dart';

final class ApplicationConfig {
  Future<void> configureApp(List<DeviceOrientation> orientations) async {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureStatusBar();
    await _configurePreferredOrientation(orientations);
    await _loadEnvs();
  }

  Future<void> _loadEnvs() => Environments.instance.loadEnvs();

  Future<void> _configureStatusBar() async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.instance.statusBar,
        statusBarIconBrightness: AppColors.instance.brightnessAndroid,
        statusBarBrightness: AppColors.instance.brightnessIos,
      ),
    );
  }

  Future<void> _configurePreferredOrientation(
      List<DeviceOrientation> orientations) async {
    SystemChrome.setPreferredOrientations(orientations);
  }
}
