import 'package:flutter/material.dart';

class GradientScaffoldStyle extends ThemeExtension<GradientScaffoldStyle> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;

  const GradientScaffoldStyle({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
  });

  @override
  ThemeExtension<GradientScaffoldStyle> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
  }) {
    return GradientScaffoldStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
    );
  }

  @override
  ThemeExtension<GradientScaffoldStyle> lerp(
      ThemeExtension<GradientScaffoldStyle>? other, double t) {
    if (other is! GradientScaffoldStyle) {
      return this;
    }
    return GradientScaffoldStyle(
      primaryColor:
          Color.lerp(primaryColor, other.primaryColor, t) ?? primaryColor,
      secondaryColor:
          Color.lerp(secondaryColor, other.secondaryColor, t) ?? secondaryColor,
      tertiaryColor:
          Color.lerp(tertiaryColor, other.tertiaryColor, t) ?? tertiaryColor,
    );
  }

  @override
  String toString() {
    return 'GradientScaffoldStyle(primaryColor: $primaryColor, secondaryColor: $secondaryColor, tertiaryColor: $tertiaryColor)';
  }
}
