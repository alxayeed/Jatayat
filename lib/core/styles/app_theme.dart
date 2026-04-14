import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: AppColors.primaryGreen,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    fontFamily: 'HindSiliguri', // Ensure this is in your pubspec.yaml
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryGreen,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    // Changed CardTheme to CardThemeData
    cardTheme: CardThemeData(
      color: AppColors.surfaceLight,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.primaryGreen,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    fontFamily: 'HindSiliguri',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0D2B10),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    // Changed CardTheme to CardThemeData
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}