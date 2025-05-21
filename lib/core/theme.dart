import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF181818);
  static const primaryText = Color(0xFFFFFFFF);
  static const secondaryText = Color(0xFFA0A0A0);
  static const accent = Color(0xFF21C47B);
  static const card = Color(0xFF232323);
  static const divider = Color(0xFF2C2C2C);
}

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(color: AppColors.secondaryText, fontSize: 14),
      bodyMedium: TextStyle(color: AppColors.primaryText, fontSize: 14),
    ),
    dividerColor: AppColors.divider,
    cardColor: AppColors.card,
    iconTheme: const IconThemeData(color: AppColors.primaryText),
  );
}
