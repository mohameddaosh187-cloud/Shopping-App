import 'package:flutter/material.dart';
import 'package:shopping_app/core/theme/app_colors.dart';

abstract class AppTheme {
  // ==================== Typography ====================

  static TextStyle get h2 => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'Inter',
  );

  static TextStyle get h3 => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'Inter',
  );

  static TextStyle get bodyLarge => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: 'Inter',
  );

  static TextStyle get bodyMedium => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: 'Inter',
  );

  static TextStyle get bodySmall => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: 'Inter',
  );

  static TextStyle get buttonText => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontFamily: 'Inter',
  );

  static TextStyle get caption => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontFamily: 'Inter',
  );

  static TextStyle get authTitle => const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Color(0xFF1F1F1F),
  );

  static TextStyle get authFieldLabel => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color(0xFF212121),
  );

  static TextStyle get authInputText =>
      const TextStyle(fontSize: 14, color: Color(0xFF212121));

  static TextStyle get authHint =>
      const TextStyle(fontSize: 14, color: AppColors.authHint);

  static TextStyle get authButtonText => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle get authFooter =>
      const TextStyle(fontSize: 14, color: Color(0xFF212121));

  static TextStyle get authLink => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xFF212121),
  );

  static OutlineInputBorder get authInputBorder => OutlineInputBorder(
    borderRadius: borderRadiusMedium,
    borderSide: const BorderSide(color: AppColors.authFieldBorder),
  );

  static OutlineInputBorder get authFocusedInputBorder => OutlineInputBorder(
    borderRadius: borderRadiusMedium,
    borderSide: const BorderSide(color: AppColors.primaryOrange, width: 1.2),
  );

  static OutlineInputBorder get authErrorInputBorder => OutlineInputBorder(
    borderRadius: borderRadiusMedium,
    borderSide: const BorderSide(color: Color(0xFFD32F2F)),
  );

  // ==================== Spacing ====================

  static const double spacing2 = 8;
  static const double spacing3 = 16;
  static const double spacing4 = 24;
  static const double spacing5 = 32;
  static const double spacing6 = 40;
  static const double spacing7 = 48;

  // Page Padding
  static const double screenPadding = 16;

  // ==================== Border Radius ====================

  static const double radiusSmall = 4;
  static const double radiusMedium = 8;
  static const double radiusLarge = 12;
  static const double radiusXLarge = 16;

  // Border Radius Objects
  static BorderRadius get borderRadiusSmall =>
      BorderRadius.circular(radiusSmall);

  static BorderRadius get borderRadiusMedium =>
      BorderRadius.circular(radiusMedium);

  static BorderRadius get borderRadiusLarge =>
      BorderRadius.circular(radiusLarge);

  // ==================== Sizes ====================

  static const double buttonHeight = 48;
  static const double inputHeight = 48;
  static const double iconSize = 24;

  // ==================== Borders ====================

  static const double borderWidth = 1;

  static BorderSide get defaultBorder =>
      BorderSide(color: AppColors.border, width: borderWidth);

  // ==================== Main Theme ====================

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.light(
        primary: AppColors.buttonPrimary,
        secondary: AppColors.orangeLight,
        surface: AppColors.background,
        onPrimary: AppColors.white,
        onSecondary: AppColors.charcoal,
        onSurface: AppColors.textPrimary,
        error: Color(0xFFFF5252),
      ),

      // Text Theme
      textTheme: TextTheme(
        headlineMedium: h2,
        headlineSmall: h3,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: buttonText,
        labelSmall: caption,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: h3,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.buttonText,
          minimumSize: const Size(double.infinity, buttonHeight),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: borderRadiusMedium),
          textStyle: buttonText,
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.buttonPrimary,
          minimumSize: const Size(double.infinity, buttonHeight),
          side: const BorderSide(color: AppColors.buttonPrimary),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusMedium),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.offWhite,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacing3,
          vertical: spacing2,
        ),

        border: OutlineInputBorder(
          borderRadius: borderRadiusMedium,
          borderSide: defaultBorder,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadiusMedium,
          borderSide: defaultBorder,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusMedium,
          borderSide: const BorderSide(
            color: AppColors.buttonPrimary,
            width: 1,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: borderRadiusMedium,
          borderSide: const BorderSide(color: Color(0xFFFF5252)),
        ),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primaryOrange,
        selectionHandleColor: AppColors.primaryOrange,
      ),

      // Divider Theme
      dividerColor: AppColors.border,
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
      ),
    );
  }
}
