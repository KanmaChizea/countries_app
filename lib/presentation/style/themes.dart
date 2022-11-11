import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: lightGrey,
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.black),
        checkColor: MaterialStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0),
    textTheme: GoogleFonts.firaSansTextTheme(const TextTheme(
      bodyText1: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
      bodyText2: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
    )));
ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: blue,
    primaryColor: lightBlue,
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.white),
        checkColor: MaterialStateProperty.all(blue),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0),
    textTheme: GoogleFonts.firaSansTextTheme(const TextTheme(
      bodyText1:
          TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500),
      bodyText2:
          TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w300),
    )));
