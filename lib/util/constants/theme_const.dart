import 'package:flutter/material.dart';
import 'package:ow_api_app/util/constants/font_const.dart';
import 'color_const.dart';

class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
      primaryColor: ColorConst.lightPrimaryColor,
      accentColor: ColorConst.lightAccentColor,
      backgroundColor: ColorConst.lightBackgroundColor,
      cardColor: ColorConst.lightCardColor,
      canvasColor: ColorConst.lightCanvasColor,
      bottomAppBarColor: ColorConst.lightCanvasColor,
      hintColor: ColorConst.profileVisibilityColor,
      highlightColor: ColorConst.lightHighlightColor,
      errorColor: ColorConst.errorColor,
      buttonColor: ColorConst.lightButtonColor,
      dividerColor: ColorConst.lightDividerColor,
      primaryTextTheme: TextTheme(
        bodyText2: FontConst.REGULAR_DEFAULT_BLACK,
        bodyText1: FontConst.REGULAR_SMALL_BLACK,
        headline5: FontConst.LARGE_TILE,
        headline4: FontConst.REGULAR_TILE_BLACK,
        headline3: FontConst.REGULAR_SMALL_BLACK,
        headline2: FontConst.LARGE_NAME_TITLE,
        headline1: FontConst.LARGE_TILE_WHITE,
        subtitle1: FontConst.REGULAR_SMALL_BLACK,
        subtitle2: FontConst.REGULAR_ERROR,
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      primaryColor: ColorConst.darkPrimaryColor,
      accentColor: ColorConst.darkCanvasColor,
      backgroundColor: ColorConst.darkBackgroundColor,
      cardColor: ColorConst.darkCardColor,
      canvasColor: ColorConst.darkCanvasColor,
      bottomAppBarColor: ColorConst.darkCanvasColor,
      hintColor: ColorConst.profileVisibilityColor,
      highlightColor: ColorConst.darkHighlightColor,
      errorColor: ColorConst.errorColor,
      buttonColor: ColorConst.darkButtonColor,
      dividerColor: ColorConst.darkCanvasColor,
      primaryTextTheme: TextTheme(
        bodyText2: FontConst.REGULAR_DEFAULT_WHITE,
        bodyText1: FontConst.REGULAR_SMALL_WHITE,
        headline5: FontConst.LARGE_TILE,
        headline4: FontConst.REGULAR_TILE_WHITE,
        headline3: FontConst.REGULAR_SMALL_WHITE,
        headline2: FontConst.LARGE_NAME_TITLE,
        headline1: FontConst.LARGE_TILE_WHITE,
        subtitle1: FontConst.REGULAR_SMALL_WHITE,
        subtitle2: FontConst.REGULAR_ERROR,
      ),
    );
  }
}
