import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // ==========================================
  // BRANDING & HEADLINES (Work Sans)
  // ==========================================

  /// The "Where to?" massive headline
  static const headline = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w900,
    fontSize: 40,
    color: AppColors.primary,
    letterSpacing: -1.5,
    height: 1.1,
  );

  /// The Jatayat logo in the AppBar
  static const logo = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    fontSize: 24,
    color: AppColors.primary,
    letterSpacing: -0.5,
  );

  /// Hero Price (৳35) - Uses Black Italic
  static const priceHero = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    fontSize: 32,
    color: AppColors.primary,
    height: 1.0,
  );

  // ==========================================
  // UI & LABELS (Inter Variable)
  // ==========================================

  /// Labels like "FROM" and "TO" - Extra Bold
  static const label = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w800,
    fontSize: 11,
    letterSpacing: 1.5,
    color: AppColors.primary,
  );

  /// Main UI text, buttons, and input hints
  static const bodyMain = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.onSurface,
  );

  /// Small metadata like "60% Full" or "Arriving in 4 min"
  static const caption = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 10,
    color: AppColors.outline,
    letterSpacing: 0.5,
  );

  // ==========================================
  // BANGLA CONTENT (Hind Siliguri)
  // ==========================================

  /// Stop names and Bus names in Bangla
  static const banglaName = TextStyle(
    fontFamily: 'HindSiliguri',
    fontWeight: FontWeight.w700, // Bold
    fontSize: 18,
    color: AppColors.onSurface,
    height: 1.2,
  );

  /// Smaller Bangla secondary text
  static const banglaSecondary = TextStyle(
    fontFamily: 'HindSiliguri',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.onSurfaceVariant,
  );
}