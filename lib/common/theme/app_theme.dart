import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBgColors,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBgColors,
      iconTheme: IconThemeData(color: AppColors.mainColor),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.mainColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: _getTextTheme(AppColors.lightTextColors),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBgColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBgColor,
      iconTheme: IconThemeData(color: AppColors.mainColor),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.mainColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: _getTextTheme(AppColors.darkTextColor),
  );
  static TextTheme _getTextTheme(Color textColor) {
    return TextTheme(
      labelSmall: TextStyle(
        color: textColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: textColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
