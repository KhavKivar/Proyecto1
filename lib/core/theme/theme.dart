import 'package:flutter/material.dart';
import 'package:tuterritorio/core/const.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: PRIMARY_COLOR,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Urbanist',
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w600,
              fontSize: LARGE_SIZE_TEXT),
          titleMedium: TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w600,
              fontSize: MEDIUM_SIZE_TEXT),
          titleSmall: TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w600,
              fontSize: SMALL_SIZE_TEXT),
          displayLarge: TextStyle(
              color: SECONDARY_COLOR,
              fontWeight: FontWeight.w600,
              fontSize: LARGE_SIZE_TEXT),
          displayMedium: TextStyle(
              color: SECONDARY_COLOR,
              fontWeight: FontWeight.w600,
              fontSize: MEDIUM_SIZE_TEXT),
          displaySmall: TextStyle(
              color: SECONDARY_COLOR,
              fontWeight: FontWeight.w600,
              fontSize: SMALL_SIZE_TEXT),
          headlineMedium: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: MEDIUM_SIZE_TEXT)),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Urbanist',
      brightness: Brightness.dark,
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: LARGE_SIZE_TEXT),
          titleMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: MEDIUM_SIZE_TEXT),
          titleSmall: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: SMALL_SIZE_TEXT),
          displayLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: LARGE_SIZE_TEXT),
          displayMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: MEDIUM_SIZE_TEXT),
          displaySmall: TextStyle(
              color: SECONDARY_COLOR,
              fontWeight: FontWeight.w600,
              fontSize: SMALL_SIZE_TEXT),
          headlineMedium: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: MEDIUM_SIZE_TEXT)),
    );
  }
}
