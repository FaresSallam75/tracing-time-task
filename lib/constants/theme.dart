import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracing_time/constants/mycolors.dart';
import 'package:tracing_time/main.dart';

ThemeData themeLight = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.3,
    iconTheme: IconThemeData(color: AppColor.black),
    titleTextStyle: TextStyle(
      color: AppColor.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.cairo().fontFamily,
    ), // Cairo

    backgroundColor: AppColor.black,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.black,
  ),
  fontFamily: GoogleFonts.cairo().fontFamily,
  iconTheme: IconThemeData(size: 20.0, color: AppColor.black),
  textTheme: TextTheme(
    /*   titleLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: AppColor.secondColor), */
    headlineLarge: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
    ),
    headlineMedium: GoogleFonts.cairo(
      textStyle: TextStyle(
        color: AppColor.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ),

    headlineSmall: GoogleFonts.cairo(
      textStyle: TextStyle(
        color: AppColor.grey,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),

  buttonTheme: ButtonThemeData(
    buttonColor: AppColor.black,
    textTheme: ButtonTextTheme.accent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  ),
);

// darkc theme
ThemeData themeDark = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.3,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.cairo().fontFamily,
    ),
    backgroundColor: AppColor.black,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.black,
  ),
  fontFamily: GoogleFonts.cairo().fontFamily,
  iconTheme: const IconThemeData(size: 20.0, color: AppColor.white),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: (myBox!.get("isDark") ?? false)
            ? AppColor.black
            : Colors.white, //white70
      ),
    ),
    headlineMedium: GoogleFonts.cairo(
      textStyle: TextStyle(
        color: (myBox!.get("isDark") ?? false)
            ? AppColor.black
            : Colors.white, //white
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ),
    headlineSmall: GoogleFonts.cairo(
      textStyle: TextStyle(
        color: (myBox!.get("isDark") ?? false)
            ? AppColor.black
            : Colors.white, //white70
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    buttonColor: AppColor.black, //primary
  ),
);
