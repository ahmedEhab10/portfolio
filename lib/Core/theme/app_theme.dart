

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ── Color Palette ─────────────────────────────────────────────────
class AppColors {
  // Backgrounds
  static const bg = Color(0xFF0A0A0F);
  static const bg2 = Color(0xFF111118);
  static const bg3 = Color(0xFF1A1A24);
  static const bgElevated = Color(0xFF1E1E2A);

  // Accents
  static const accent = Color(0xFF7C6FFF);
  static const accentLight = Color(0xFF9B8FFF);
  static const accent2 = Color(0xFF00E5B0);
  static const accent2Light = Color(0xFF33FFCC);

  // Text
  static const textPrimary = Color(0xFFF0F0F5);
  static const textSecondary = Color(0xFFCCCCDD);
  static const textMuted = Color(0xFF888899);

  // Borders & Surfaces
  static const border = Color(0x2E7C6FFF);
  static const borderLight = Color(0x447C6FFF);
  static const glassBg = Color(0x0DFFFFFF);
  static const glassStroke = Color(0x1AFFFFFF);

  // Status
  static const success = Color(0xFF00E5B0);
  static const warning = Color(0xFFFFB84D);
  static const error = Color(0xFFFF5C5C);
}

// ── Gradients ─────────────────────────────────────────────────────
class AppGradients {
  static const heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0A0A0F),
      Color(0xFF12101F),
      Color(0xFF0A0A0F),
    ],
  );

  static const accentGradient = LinearGradient(
    colors: [AppColors.accent, Color(0xFF6C5CE7)],
  );

  static const cardHoverGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x0D7C6FFF),
      Color(0x0500E5B0),
    ],
  );

  static const glowGradient = RadialGradient(
    colors: [
      Color(0x337C6FFF),
      Color(0x007C6FFF),
    ],
  );
}

// ── Spacing ───────────────────────────────────────────────────────
class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 48.0;
  static const xxxl = 64.0;
  static const section = 80.0;
}

// ── Radius ────────────────────────────────────────────────────────
class AppRadius {
  static const sm = 6.0;
  static const md = 10.0;
  static const lg = 14.0;
  static const xl = 20.0;
  static const round = 100.0;
}

// ── Shadows ───────────────────────────────────────────────────────
class AppShadows {
  static final cardShadow = [
    BoxShadow(
      color: const Color(0x337C6FFF).withAlpha(20),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];

  static final glowShadow = [
    BoxShadow(
      color: AppColors.accent.withAlpha(60),
      blurRadius: 30,
      spreadRadius: 2,
    ),
  ];

  static final accentGlow = [
    BoxShadow(
      color: AppColors.accent.withAlpha(40),
      blurRadius: 40,
      spreadRadius: 0,
    ),
  ];
}

// ── Decorations ───────────────────────────────────────────────────
class AppDecorations {
  static BoxDecoration get glass => BoxDecoration(
        color: AppColors.glassBg,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.glassStroke, width: 0.5),
      );

  static BoxDecoration get card => BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.border, width: 0.5),
      );

  static BoxDecoration get cardHover => BoxDecoration(
        gradient: AppGradients.cardHoverGradient,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.borderLight, width: 0.5),
        boxShadow: AppShadows.cardShadow,
      );
}

// ── Text Styles ───────────────────────────────────────────────────
class AppTextStyles {
  static TextStyle get _base => GoogleFonts.spaceMono();

  static TextStyle get displayLarge => _base.copyWith(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.15,
        letterSpacing: -0.5,
      );

  static TextStyle get displayMedium => _base.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get heading => _base.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  static TextStyle get subheading => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
      );

  static TextStyle get body => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.8,
      );

  static TextStyle get bodySmall => _base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.7,
      );

  static TextStyle get caption => _base.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.accent2,
        letterSpacing: 2,
      );

  static TextStyle get label => _base.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        letterSpacing: 0.5,
      );

  static TextStyle get navItem => _base.copyWith(
        fontSize: 11,
        color: AppColors.textMuted,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get navItemActive => navItem.copyWith(
        color: AppColors.accent,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get chip => _base.copyWith(
        fontSize: 10,
        color: AppColors.accent2,
        letterSpacing: 0.5,
      );

  static TextStyle get button => _base.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      );
}

// ── Theme Data ────────────────────────────────────────────────────
class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          secondary: AppColors.accent2,
          surface: AppColors.bg2,
        ),
        textTheme: GoogleFonts.spaceMonoTextTheme().apply(
          bodyColor: AppColors.textPrimary,
          displayColor: AppColors.textPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            textStyle: AppTextStyles.button,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.accent2,
            side: const BorderSide(color: AppColors.accent2, width: 0.5),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            textStyle: AppTextStyles.button,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.bg3,
          labelStyle: AppTextStyles.label,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: const BorderSide(color: AppColors.border, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: const BorderSide(color: AppColors.border, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: const BorderSide(color: AppColors.accent, width: 1),
          ),
        ),
      );
}
