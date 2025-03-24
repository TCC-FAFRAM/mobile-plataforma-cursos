import 'package:flutter/material.dart';

import 'base_theme.dart';
import 'styling/doughnut_chart_style.dart';
import 'styling/filled_button_style.dart';
import 'styling/floating_action_button_style.dart';
import 'styling/gradient_scaffold_style.dart';
import 'styling/theme_color_style.dart';

class UltramarineLightTheme extends BaseTheme {
  @override
  BackgroundTheme get backgroundTheme {
    return const BackgroundTheme(
      primaryColor: Color(0xFFFFFFFF),
      secondaryColor: Color(0xFF1F1F1F),
      tertiaryColor: Color(0x1F1F1F08),
      quaternaryColor: Color(0xFFF1F2F4),
      senary: Color(0xff32C74F),
    );
  }

  @override
  ThemeColorStyle get themeColorStyle {
    return const ThemeColorStyle(
      primaryColor: Color.fromARGB(255, 42, 40, 68),
      secondaryColor: Color(0xFF1F1F1F),
      tertiaryColor: Color(0xFF8B8B8B),
      quaternaryColor: Color.fromARGB(255, 10, 90, 79),
      quinaryColor: Color(0xFFFFFFFF),
      senaryColor: Color(0xFFFF3932),
      septenaryColor: Color(0xFFF1F2F4),
      octonaryColor: Color(0xFFBCBCBC),
      nonaryColor: Color(0xFFE31414),
    );
  }

  @override
  FontTheme get fontTheme {
    return FontTheme(
      heading1: TextStyle(
        fontSize: 30,
        color: themeColorStyle.secondaryColor,
      ),
      heading2: TextStyle(
        fontSize: 25,
        height: 1.8,
        letterSpacing: -0.2,
        color: themeColorStyle.secondaryColor,
      ),
      heading3: TextStyle(
        fontSize: 20,
        height: 1.4,
        color: themeColorStyle.secondaryColor,
      ),
      body1: TextStyle(
        fontSize: 16,
        color: themeColorStyle.tertiaryColor,
      ),
      body2: TextStyle(
        fontSize: 14,
        height: 1.0,
        color: themeColorStyle.tertiaryColor,
      ),
      caption: TextStyle(
        fontSize: 12,
        color: themeColorStyle.tertiaryColor,
      ),
    );
  }

  @override
  FontFamily get fontFamily {
    return FontFamily(
      primary: 'Inter',
    );
  }

  @override
  GradientScaffoldStyle get gradientScaffoldStyle {
    return const GradientScaffoldStyle(
      primaryColor: Color.fromARGB(158, 10, 90, 79),
      secondaryColor: Color.fromARGB(125, 255, 132, 61),
      tertiaryColor: Color.fromARGB(125, 17, 72, 104),
    );
  }

  @override
  FloatingActionButtonStyle get floatingActionButtonStyle {
    return FloatingActionButtonStyle(
      primaryFloatingButton: themeColorStyle.primaryColor,
      secondaryFloatingButton: backgroundTheme.senary,
    );
  }

  @override
  CustomButtonTheme get customButtonTheme {
    return CustomButtonTheme(
      primaryFilledButtonTheme: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(themeColorStyle.primaryColor),
        elevation: WidgetStateProperty.all<double>(0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
        foregroundColor:
            WidgetStateProperty.all<Color>(themeColorStyle.quinaryColor),
        textStyle: WidgetStateProperty.all<TextStyle>(
            fontTheme.body2.copyWith(fontWeight: FontWeight.w500)),
      ),
      dangerFilledButtonTheme: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(themeColorStyle.nonaryColor),
        elevation: WidgetStateProperty.all<double>(0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
        foregroundColor:
            WidgetStateProperty.all<Color>(themeColorStyle.quinaryColor),
        textStyle: WidgetStateProperty.all<TextStyle>(
            fontTheme.body2.copyWith(fontWeight: FontWeight.w500)),
      ),
      inactiveFilledButtonTheme: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(backgroundTheme.quaternaryColor),
        elevation: WidgetStateProperty.all<double>(0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
        foregroundColor:
            WidgetStateProperty.all<Color>(themeColorStyle.tertiaryColor),
        textStyle: WidgetStateProperty.all<TextStyle>(
            fontTheme.body2.copyWith(fontWeight: FontWeight.w400)),
      ),
    );
  }

  @override
  DoughnutChartStyle get doughnutChartStyle {
    return const DoughnutChartStyle(
      primaryColor: Color.fromARGB(255, 10, 90, 79),
      secondaryColor: Color.fromARGB(255, 90, 65, 10),
      tertiaryColor: Color(0xFFFFC169),
      quaternaryColor: Color.fromARGB(255, 10, 90, 79),
      quinaryColor: Color.fromARGB(255, 10, 90, 79),
      octonaryColor: Color.fromARGB(255, 10, 90, 79),
    );
  }
}
