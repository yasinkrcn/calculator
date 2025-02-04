import 'package:flutter/material.dart';
import 'package:calculator/core/constants/theme/app_colors.dart';

class AppTheme {
  /// Dark theme configuration optimized for calculator interface
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.purple,
    scaffoldBackgroundColor: AppColors.black,

    // Color scheme configuration
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.purple,
      secondary: AppColors.green,
      surface: AppColors.lightBlack,
      background: AppColors.black,
      error: AppColors.errorRed,
      onSurface: Colors.white,
      onBackground: Colors.white,
    ),

    // Text theme for calculator display and buttons
    textTheme: const TextTheme(
      // Result display style
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        height: 1.2,
      ),
      // Equation display style
      displayMedium: TextStyle(
        color: Colors.white70,
        fontSize: 28,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.3,
      ),
      // Number button style
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      // Operator button style
      labelLarge: TextStyle(
        color: AppColors.purple,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),

    // Card theme for calculator display
    cardTheme: CardTheme(
      color: AppColors.lightBlack,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),

    // Divider theme for visual separation
    dividerTheme: DividerThemeData(
      color: Colors.white.withOpacity(0.1),
      thickness: 1,
      space: 16,
    ),

    // Button theme for calculator keys
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightBlack,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(16),
      ),
    ),
  );

  /// Light theme configuration optimized for calculator interface
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.purple,
    scaffoldBackgroundColor: Colors.white,

    // Color scheme configuration
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.purple,
      secondary: AppColors.green,
      surface: Colors.white,
      background: AppColors.lightGrey,
      error: AppColors.errorRed,
      onSurface: Colors.black,
      onBackground: Colors.black,
    ),

    // Text theme for calculator display and buttons
    textTheme: const TextTheme(
      // Result display style
      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 48,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        height: 1.2,
      ),
      // Equation display style
      displayMedium: TextStyle(
        color: Colors.black87,
        fontSize: 28,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.3,
      ),
      // Number button style
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      // Operator button style
      labelLarge: TextStyle(
        color: AppColors.purple,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),

    // Card theme for calculator display
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),

    // Divider theme for visual separation
    dividerTheme: DividerThemeData(
      color: Colors.black.withOpacity(0.1),
      thickness: 1,
      space: 16,
    ),

    // Button theme for calculator keys
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(16),
      ),
    ),
  );

  // Prevent instantiation
  const AppTheme._();
}
