import 'package:flutter/material.dart';

class CBThemeConfig {
  CBThemeConfig._();
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      error: Color.fromARGB(255, 255, 0, 55),
      errorContainer: Color.fromARGB(255, 255, 202, 213),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
      ),
    ),
  );
}

extension T on BuildContext {
  ThemeData get theme => CBThemeConfig.theme;
}
