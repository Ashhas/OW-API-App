import 'package:flutter/material.dart';

class AppThemes {
  static const Color _profileVisibilityColor =
      Color.fromRGBO(246, 246, 133, 1.0);
  static const Color _errorColor = Colors.red;

  static const Color _lightPrimaryColor = Color(0xFFF26513);
  static const Color _lightAccentColor = Color(0xFF01407c);
  static const Color _lightCanvasColor = Color(0xFFffffff);
  static const Color _lightCardColor = Color(0xFF2B2B31);
  static const Color _lightTileColor = Color(0xFFffffff);
  static const Color _lightBackgroundColor = Color(0xFFF8F8F8);
  static const Color _lightPrimaryTextColor = Color(0xFF323238);

  static const Color _darkPrimaryColor = Color(0xFFF26513);
  static const Color _darkCanvasColor = Color(0xFF2D2F34);
  static const Color _darkCardColor = Color(0xFF2B2B31);
  static const Color _darkTileColor = Color(0xFF383B40);
  static const Color _darkBackgroundColor = Color(0xFF27292D);
  static const Color _darkPrimaryTextColor = Color(0xFFF4F6FF);

  static ThemeData getLightTheme() {
    return ThemeData(
      primaryColor: _lightPrimaryColor,
      accentColor: _lightAccentColor,
      backgroundColor: _lightBackgroundColor,
      cardColor: _lightCardColor,
      canvasColor: _lightCanvasColor,
      buttonColor: _lightTileColor,
      bottomAppBarColor: _lightBackgroundColor,
      hintColor: _profileVisibilityColor,
      primaryTextTheme: TextTheme(
        bodyText2: TextStyle(
          fontSize: 15,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w700,
        ),
        bodyText1: TextStyle(
          fontSize: 14,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        headline6: TextStyle(
          fontSize: 14,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w600,
        ),
        headline5: TextStyle(
          fontSize: 14,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        headline4: TextStyle(
          fontSize: 19,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w700,
        ),
        headline3: TextStyle(
          fontSize: 27,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w700,
        ),
        headline2: TextStyle(
          fontSize: 21,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w800,
        ),
        headline1: TextStyle(
          fontSize: 14,
          color: _errorColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        button: TextStyle(
          fontSize: 15,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w700,
        ),
        caption: TextStyle(
          fontSize: 13,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        subtitle1: TextStyle(
          fontSize: 14,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        subtitle2: TextStyle(
          fontSize: 16,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      primaryColor: _darkPrimaryColor,
      backgroundColor: _darkBackgroundColor,
      cardColor: _darkCardColor,
      canvasColor: _darkCanvasColor,
      buttonColor: _darkTileColor,
      bottomAppBarColor: _darkBackgroundColor,
      hintColor: _profileVisibilityColor,
      primaryTextTheme: TextTheme(
        bodyText2: TextStyle(
          fontSize: 15,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w700,
        ),
        bodyText1: TextStyle(
          fontSize: 14,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        headline6: TextStyle(
          fontSize: 14,
          color: _lightPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w600,
        ),
        headline5: TextStyle(
          fontSize: 14,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        headline4: TextStyle(
          fontSize: 19,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w700,
        ),
        headline3: TextStyle(
          fontSize: 27,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w700,
        ),
        headline2: TextStyle(
          fontSize: 21,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w800,
        ),
        headline1: TextStyle(
          fontSize: 14,
          color: _errorColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        button: TextStyle(
          fontSize: 15,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w700,
        ),
        caption: TextStyle(
          fontSize: 13,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        subtitle1: TextStyle(
          fontSize: 14,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        subtitle2: TextStyle(
          fontSize: 16,
          color: _darkPrimaryTextColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
