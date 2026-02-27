import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoomit_bloc/theme/constant.dart';

class ThemeConfig {
//! lIGHT
  static ThemeData get lightTheme {
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(kBlackColor),
        ),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(2555, 2555, 2555, 255),
      primaryColor: kWhiteColor,
      useMaterial3: true,
      fontFamily: GoogleFonts.vazirmatn().fontFamily,
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontSize: 15),
        bodyMedium: TextStyle(fontSize: 17),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: kLightBlueColor,
        primary: kWhiteColor,
      ),
    );
  }

//! DARK
  static ThemeData get darkTheme {
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 232, 226, 216)),
        ),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 32, 36, 37),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: kLightBlueColor,
        primary: kSemiBlackColor,
      ),
      fontFamily: GoogleFonts.vazirmatn().fontFamily,
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontSize: 15),
        bodyMedium: TextStyle(color: kWhiteColor, fontSize: 17),
      ),
      primaryColor: kWhiteColor,
      useMaterial3: true,
    );
  }
}
