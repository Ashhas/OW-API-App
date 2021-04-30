import 'package:flutter/material.dart';

class AppThemes {
  static const Color _darkPrimaryColor = Color(0xFFF26513);
  static const Color _darkCanvasColor = Color(0xFF303035);
  static const Color _darkCardColor = Color(0xFF2B2B31);
  static const Color _darkTileColor = Color(0xFF333438);
  static const Color _darkBackgroundColor = Color(0xFF2A2B2F);
  static const Color _darkPrimaryTextColor = Color(0xFFF4F6FF);

  static ThemeData getDarkTheme() {
    return ThemeData(
      primaryColor: _darkPrimaryColor,
      backgroundColor: _darkBackgroundColor,
      cardColor: _darkCardColor,
      canvasColor: _darkCanvasColor,
      buttonColor: _darkTileColor,
      bottomAppBarColor: _darkBackgroundColor,
    );
  }
}
