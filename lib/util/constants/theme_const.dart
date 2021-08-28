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
      bottomAppBarColor: ColorConst.lightBottomAppBarColor,
      hintColor: ColorConst.profileVisibilityColor,
      highlightColor: ColorConst.lightHighlightColor,
      errorColor: ColorConst.errorColor,
      buttonColor: ColorConst.lightButtonColor,
      dividerColor: ColorConst.lightDividerColor,
      primaryTextTheme: TextTheme(
        headline5: FontConst.LARGE_TILE,
        headline4: FontConst.REGULAR_TILE_BLACK,
        headline3: FontConst.BOLD_TITLE_VIEW_BLACK,
        headline2: FontConst.LARGE_NAME_TITLE,
        headline1: FontConst.LARGE_TILE_WHITE,
        subtitle1: FontConst.REGULAR_SMALL_BLACK,
        subtitle2: FontConst.REGULAR_ERROR,
        bodyText2: FontConst.REGULAR_DEFAULT_BLACK,
        bodyText1: FontConst.REGULAR_SMALL_BLACK,
      ),
    );
  }
}
