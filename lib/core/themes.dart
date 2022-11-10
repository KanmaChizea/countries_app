import 'package:countries/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        titleTextStyle: GoogleFonts.elsieSwashCaps(color: Colors.black),
        elevation: 0),
    textTheme: GoogleFonts.firaSansTextTheme());
ThemeData dark = ThemeData(
    scaffoldBackgroundColor: blue,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0),
    textTheme: GoogleFonts.firaSansTextTheme());
