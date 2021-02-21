import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static ThemeData light() {
    final textTheme = _getTextTheme(Brightness.light);
    return ThemeData(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
    );
  }

  static ThemeData dark() {
    final textTheme = _getTextTheme(Brightness.dark);
    return ThemeData(
      primaryColor: _primaryColor,
      brightness: Brightness.dark,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
    );
  }
  static const _accentColor = Colors.blueGrey;
  static const _primaryColor = Colors.black;

  static TextTheme _getTextTheme(Brightness brightness){
    final themeData= ThemeData(brightness: brightness);
    return GoogleFonts.exo2TextTheme(themeData.textTheme).copyWith(
      headline1: GoogleFonts.orbitron(),
      headline2: GoogleFonts.orbitron(),
      headline3: GoogleFonts.orbitron(),
      headline4:  GoogleFonts.orbitron(),
      headline5:  GoogleFonts.orbitron(),
      headline6:  GoogleFonts.orbitron(),

    );
  }
}