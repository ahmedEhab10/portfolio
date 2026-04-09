import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFF0D0D0F);
  static const bg2 = Color(0xFF13131A);
  static const bg3 = Color(0xFF1A1A24);
  static const accent = Color(0xFF7C6FFF);
  static const accent2 = Color(0xFF00E5B0);
  static const textPrimary = Color(0xFFF0F0F5);
  static const textMuted = Color(0xFF888899);
  static const border = Color(0x2E7C6FFF);
}

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
  );
}
