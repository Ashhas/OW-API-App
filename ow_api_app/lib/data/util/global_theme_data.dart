import 'package:flutter/material.dart';

class GlobalThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    primaryVariant: Color(0xFF117378),
    secondary: Color(0xFFEFF3F3),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryVariant: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryVariant: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  ///TextTheme information///
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

// static final TextTheme _textTheme = TextTheme(
//   headline4: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
//   caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
//   headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
//   subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
//   overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
//   bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
//   subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
//   bodyText2: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
//   headline6: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
//   button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
// );
}
