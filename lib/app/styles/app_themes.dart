import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    filledButtonTheme: filledButtonTheme,
    useMaterial3: true,
  );

  static const filledButtonTheme = FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.primary),
      fixedSize: WidgetStatePropertyAll(Size(240, 48)),
    ),
  );
}
