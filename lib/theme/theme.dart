import 'package:flutter/material.dart';
import 'package:testing/constant/constant.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: kPrimaryLightColor,
      appBarTheme: const AppBarTheme(
        color: kPrimaryLightColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.raleway(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: kSecondaryLightColor),
        headline2: GoogleFonts.raleway(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        headline3: GoogleFonts.raleway(
            fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        headline4: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      cardTheme: _cardTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      canvasColor: kSecondaryLightColor,
    );
  }

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primaryColor: kPrimaryDarkColor,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kPrimaryDarkColor,
        cardColor: kSecondaryDarkColor,
        appBarTheme: const AppBarTheme(
          color: kPrimaryDarkColor,
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.raleway(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: kSecondaryLightColor),
          headline2: GoogleFonts.raleway(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          headline3: GoogleFonts.raleway(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
          headline4: GoogleFonts.raleway(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevatedButtonTheme: _elevatedButtonTheme,
        cardTheme: _cardTheme,
        canvasColor: kSecondaryLightColor,
      );

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      textStyle: Get.textTheme.button,
      fixedSize: const Size(180, 45),
    ),
  );

  static final CardTheme _cardTheme = CardTheme(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
}
