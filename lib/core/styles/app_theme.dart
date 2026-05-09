import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Primary Branding
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,

    // Default Font Family for UI (Inter Variable)
    // We override specific text widgets with HindSiliguri as needed
    fontFamily: 'Inter',

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      surfaceContainerLow: AppColors.surfaceContainerLow,
      outline: AppColors.outline,
      error: AppColors.error,
    ),

    // Match the blurred header style from HTML
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent, // Controlled by blur in screen
      foregroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontFamily: 'WorkSans',
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
        fontSize: 24,
        color: AppColors.primary,
      ),
    ),

    // Match the search container and result card styles
    cardTheme: CardThemeData(
      color: AppColors.surfaceContainerLowest,
      elevation: 0, // We use custom shadows in widgets to match HTML
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: AppColors.outlineVariant.withValues(alpha: 0.2)),
      ),
    ),

    // Floating Action Button (The "Bolt" button in HTML)
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.tertiaryFixed,
      foregroundColor: AppColors.onTertiaryFixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
    ),

    // Primary Button Style (Calculate Fare)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );

  // Note: For Dark Theme, you would typically map these to darker tonal variants
  // of the same green palette (e.g., surface-dim).
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Inter',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
  );
}