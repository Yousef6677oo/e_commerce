import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppThemes {
  static ThemeData theme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            wordSpacing: -0.17,
            color: AppColors.accentColor),
        titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            wordSpacing: -0.17,
            color: AppColors.accentColor),
        titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            wordSpacing: -0.17,
            color: AppColors.accentColor),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          wordSpacing: -0.17,
          color: AppColors.hintTextColor,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          wordSpacing: -0.17,
          color: AppColors.accentColor,
        ),
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          wordSpacing: -0.17,
          color: AppColors.primaryColor,
        ),
      ));
}
