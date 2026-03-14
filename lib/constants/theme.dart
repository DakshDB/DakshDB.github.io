import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ---------------------------------------------------------------------------
// Warm Zinc + Soft Cyan palette
// ---------------------------------------------------------------------------

class AppColors {
  // Backgrounds - Pure Black for Brutalist Flow
  static const Color bgPrimary = Color(0xFF000000);
  static const Color bgSecondary = Color(0xFF0a0a0a);
  static const Color bgTertiary = Color(0xFF141414);
  static const Color bgHover = Color(0xFF1a1a1a);

  // Borders & Dividers - Sharp White/Grey 1px lines
  static const Color border = Color(0xFF333333);
  static const Color divider = Color(0xFF333333);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFCCCCCC);
  static const Color textTertiary = Color(0xFF888888);

  // Accent — Electric Steel Blue
  static const Color accent = Color(0xFF4682b4);
  static const Color accentHover = Color(0xFF5c9bd0);
  static const Color accentMuted = Color(0xFF32628a);
  static const Color accentBg = Color(0x334682b4);

  // Semantic
  static const Color success = Color(0xFF34D399);
  static const Color tagBg = Color(0xFF111111);
}

// ---------------------------------------------------------------------------
// Typography — Inter + JetBrains Mono
// ---------------------------------------------------------------------------

class AppTextStyles {
  static TextStyle get h1 => GoogleFonts.inter(
        fontSize: 64,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        letterSpacing: -1.5,
        height: 1.1,
      );

  static TextStyle get h2 => GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
      );

  static TextStyle get h3 => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get body => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.7,
        letterSpacing: 0.2,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textTertiary,
        height: 1.6,
      );

  static TextStyle get mono => GoogleFonts.jetBrainsMono(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.accent,
        letterSpacing: 1.0,
      );

  static TextStyle get navLink => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        letterSpacing: 1.5,
      );

  static TextStyle get button => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.accent,
        letterSpacing: 1.5,
      );
}
