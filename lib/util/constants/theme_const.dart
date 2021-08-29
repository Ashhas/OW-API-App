import 'package:flutter/material.dart';
import 'package:ow_api_app/util/constants/font_const.dart';
import 'color_const.dart';

class AppTheme {
  static ThemeData getDefaultTheme() {
    return ThemeData(
      primaryColor: ColorConst.lightPrimaryColor,
      accentColor: ColorConst.lightAccentColor,
      backgroundColor: ColorConst.lightBackgroundColor,
      cardColor: ColorConst.lightCardColor,
      canvasColor: ColorConst.lightCanvasColor,
      bottomAppBarColor: ColorConst.lightBottomAppBarColor,
      errorColor: ColorConst.errorColor,
      buttonColor: ColorConst.lightButtonColor,
      dividerColor: ColorConst.lightDividerColor,
      shadowColor: ColorConst.lightShadowColor,
      hintColor: ColorConst.profileVisibilityColor,
      primaryTextTheme: TextTheme(
        headline6: FontConst.BOLD_APP_BAR_TITLE_WHITE,
        headline5: FontConst.BOLD_TITLE_ID_WHITE,
        headline4: FontConst.BOLD_TITLE_VIEW_BLACK,
        headline3: FontConst.BOLD_RANK_NUMBER_BLACK,
        subtitle2: FontConst.REGULAR_TILE_BLACK,
        subtitle1: FontConst.REGULAR_TILE_WHITE,
        bodyText2: FontConst.REGULAR_BODY_BIG_BLACK,
        bodyText1: FontConst.REGULAR_BODY_SMALL_BLACK,
      ),
    );
  }
}
