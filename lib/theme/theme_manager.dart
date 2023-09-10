import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoomit_bloc/constant.dart';

class ThemeConfig {
//! lIGHT
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(2555, 2555, 2555, 255),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(

           padding: MaterialStateProperty.all(const EdgeInsets.only(right: 7,bottom: 25,top: 0)),
  
          visualDensity:  const VisualDensity(vertical: -4), 

          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(kBlackColor),
        ),
      ),
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
      scaffoldBackgroundColor: const Color.fromARGB(255, 32, 36, 37),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,

          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 232, 226, 216)),
        ),
      ),
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
