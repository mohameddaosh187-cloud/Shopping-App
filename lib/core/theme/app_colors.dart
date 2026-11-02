import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Colors
  static const Color primaryOrange = Color(0xFFFF9900);
  static const Color orangeLight = Color(0xFFFFB700);
  static const Color orangeDark = Color(0xFFE67E00);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF7F8FA);
  static const Color lightGray = Color(0xFFECEEF2);
  static const Color charcoal = Color(0xFF1A1A2E);

  // Background Colors
  static const Color background = Color(0xFFEBEBEB);
  static const Color surface = white;

  // Text Colors
  static const Color textPrimary = charcoal;
  static const Color textSecondary = Color(0xFF757575);

  // Border Colors
  static const Color border = lightGray;

  // Button Colors
  static const Color buttonPrimary = primaryOrange;
  static const Color buttonDisabled = lightGray;
  static const Color buttonText = white;
  static const Color authFieldBorder = Color(0xFF636363);
  static const Color authHint = Color(0xFFC6C6C6);
  static const Color authSystemDivider = Color(0xFFE0E0E0);
}
