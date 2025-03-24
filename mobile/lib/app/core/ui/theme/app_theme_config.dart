import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

final class AppThemeConfig {
  AppThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(
      color: Colors.grey[400]!,
    ),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: AppColors.instance.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.instance.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.instance.black),
    ),
    primaryColor: AppColors.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.instance.primary,
      primary: AppColors.instance.primary,
      secondary: AppColors.instance.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        backgroundColor: AppColors.instance.primary,
        textStyle: AppTextStyles.instance.textButtonLabel,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all<Color>(AppColors.instance.primary),
      fillColor: WidgetStateProperty.all<Color>(AppColors.instance.white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.instance.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.instance.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: AppTextStyles.instance.textRegular
          .copyWith(color: AppColors.instance.labelStyle),
      errorStyle: AppTextStyles.instance.textRegular
          .copyWith(color: AppColors.instance.errorStyle),
    ),
    textTheme: TextTheme(
      headlineSmall: AppTextStyles.instance.textBold.copyWith(
        fontSize: 16,
      ),
      headlineMedium: AppTextStyles.instance.textBold.copyWith(
        fontSize: 20,
      ),
      headlineLarge: AppTextStyles.instance.textBold.copyWith(
        fontSize: 24,
      ),
    ),
  );
}
