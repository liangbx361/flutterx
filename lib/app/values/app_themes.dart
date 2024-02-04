import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData createLightTheme() {
    ThemeData themeData = ThemeData.from(
      useMaterial3: true,
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFFFFFFFF),
        onPrimary: const Color(0xFF15161A),
        secondary: AppColors.accentColor,
        background: AppColors.backgroundColor,
        error: const Color(0xFFFA2525),
      ),
    );
    return themeData;
  }

  static ThemeData createDarkTheme() {
    ThemeData themeData = ThemeData.from(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color(0xFF15161A),
        onPrimary: const Color(0xFFFFFFFF),
        secondary: AppColors.accentColor,
        error: const Color(0xFFFA2525),
      ),
    );
    return themeData;
  }

  static TextStyle getAppFontStyle({TextStyle? textStyle}) {
    return const TextStyle();
  }
}

class RegularTextStyle extends TextStyle {
  const RegularTextStyle({
    super.color,
    super.fontSize,
    super.fontWeight = FontWeight.w500,
    super.height,
    super.decoration,
    super.decorationColor,
    super.decorationThickness,
    super.shadows,
  });
}

class MediumTextStyle extends TextStyle {
  const MediumTextStyle({
    super.color,
    super.fontSize,
    super.fontWeight = FontWeight.w600,
  });
}

class SemiboldTextStyle extends TextStyle {
  const SemiboldTextStyle({
    super.color,
    super.fontSize,
    super.fontWeight = FontWeight.w700,
  });
}

class BoldTextStyle extends TextStyle {
  const BoldTextStyle({
    super.color,
    super.fontSize,
    super.fontWeight = FontWeight.w900,
    super.fontStyle,
    super.height,
    super.shadows,
  });
}
