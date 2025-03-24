import 'package:flutter/material.dart';

final class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  Brightness? get brightnessAndroid => Brightness.light;
  Brightness? get brightnessIos => Brightness.light;

  Color get statusBar => const Color(0xFF022615);
  Color get loader => const Color(0XFFFFFFFF);

  Color get primary => const Color(0XFF507E78);
  Color get secondary => const Color(0xFF595302);

  Color get darkGreen => const Color(0xFF022615);
  Color get olive => const Color(0xFF595302);
  Color get lightBrown => const Color(0xFFD97D48);
  Color get palePink => const Color(0xFFF2E0D5);

  Color get white => const Color(0XFFFFFFFF);
  Color get black => const Color(0xFF022615);

  Color get errorStyle => const Color(0xFF999999);
  Color get labelStyle => const Color(0xFF999999);
}

extension AppColorsExtensions on BuildContext {
  AppColors get appColors => AppColors.instance;
}
