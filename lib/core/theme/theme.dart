import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_event.dart';
import 'package:tuterritorio/core/theme/const.dart';

import 'color_scheme.dart';

Map<ThemeAppEnum, ThemeData> enumToTheme = {
  ThemeAppEnum.light: AppTheme.lightTheme,
  ThemeAppEnum.dark: AppTheme.darkTheme
};

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: lightColorScheme,
        useMaterial3: true,
        textTheme: textTheme);
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: PRIMARY_COLOR_DARK,
      colorScheme: darkColorScheme,
      useMaterial3: true,
      textTheme: textTheme,
    );
  }
}

var textTheme = TextTheme(
  displayLarge: GoogleFonts.urbanist(
    fontWeight: FontWeight.w400,
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
  ),
  displayMedium: GoogleFonts.urbanist(
    fontWeight: FontWeight.w400,
    fontSize: 45,
    height: 52 / 45,
  ),
  displaySmall: GoogleFonts.urbanist(
    fontWeight: FontWeight.w400,
    fontSize: 36,
    height: 44 / 36,
  ),
  headlineLarge: GoogleFonts.urbanist(
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 40 / 32,
  ),
  headlineMedium: GoogleFonts.urbanist(
    fontWeight: FontWeight.w400,
    fontSize: 28,
    height: 36 / 28,
  ),
  headlineSmall: GoogleFonts.urbanist(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 32 / 24,
  ),
  titleLarge: GoogleFonts.urbanist(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 28 / 22,
  ),
  titleMedium: GoogleFonts.urbanist(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.1,
  ),
  titleSmall: GoogleFonts.urbanist(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
  ),
  labelLarge: GoogleFonts.urbanist(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 20 / 14,
  ),
  labelMedium: GoogleFonts.urbanist(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 16 / 12,
  ),
  labelSmall: GoogleFonts.urbanist(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    height: 16 / 11,
  ),
  bodyLarge: GoogleFonts.urbanist(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
  ),
  bodyMedium: GoogleFonts.urbanist(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
  ),
  bodySmall: GoogleFonts.urbanist(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
  ),
);

/*
ThemeData(
      primaryColor: PRIMARY_COLOR,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Urbanist',
      useMaterial3: true,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
            fontSize: LARGE_SIZE_TEXT),
        titleMedium: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w500,
            fontSize: MEDIUM_SIZE_TEXT),
        titleSmall: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w400,
            fontSize: SMALL_SIZE_TEXT),
        displayLarge: TextStyle(
            color: SECONDARY_COLOR,
            fontWeight: FontWeight.w600,
            fontSize: LARGE_SIZE_TEXT),
        displayMedium: TextStyle(
            color: SECONDARY_COLOR,
            fontWeight: FontWeight.w500,
            fontSize: MEDIUM_SIZE_TEXT),
        displaySmall: TextStyle(
            color: SECONDARY_COLOR,
            fontWeight: FontWeight.w400,
            fontSize: SMALL_SIZE_TEXT),
        bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: SMALL_SIZE_TEXT),
        bodySmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: SMALL_SIZE_TEXT),
        headlineMedium: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: MEDIUM_SIZE_TEXT),
      ),
    );
 */