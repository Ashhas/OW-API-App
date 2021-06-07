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
      buttonColor: ColorConst.lightTileColor,
      bottomAppBarColor: ColorConst.lightBackgroundColor,
      hintColor: ColorConst.profileVisibilityColor,
      errorColor: ColorConst.errorColor,
      primaryTextTheme: TextTheme(
        bodyText2: FontConst.REGULAR_DEFAULT,
        bodyText1: FontConst.REGULAR_SMALL,
        headline3: FontConst.REGULAR_SMALL,
        headline2: FontConst.LARGE_NAME_TITLE,
        headline1: FontConst.LARGE_TILE_WHITE,
        subtitle1: FontConst.REGULAR_SMALL,
        subtitle2: FontConst.REGULAR_ERROR,
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      primaryColor: ColorConst.darkPrimaryColor,
      backgroundColor: ColorConst.darkBackgroundColor,
      cardColor: ColorConst.darkCardColor,
      canvasColor: ColorConst.darkCanvasColor,
      buttonColor: ColorConst.darkTileColor,
      bottomAppBarColor: ColorConst.darkBackgroundColor,
      hintColor: ColorConst.profileVisibilityColor,
      errorColor: ColorConst.errorColor,
      primaryTextTheme: TextTheme(
        bodyText2: FontConst.REGULAR_DEFAULT,
        bodyText1: FontConst.REGULAR_SMALL,
        headline3: FontConst.REGULAR_SMALL,
        headline2: FontConst.LARGE_NAME_TITLE,
        headline1: FontConst.LARGE_TILE_DARK,
        subtitle1: FontConst.REGULAR_SMALL,
      ),
    );
  }
}
