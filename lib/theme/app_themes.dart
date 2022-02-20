import 'package:flutter/material.dart';
import 'color_const.dart';
import 'font_const.dart';

class AppThemes {
  static ThemeData getDefaultTheme() {
    return ThemeData(
      primaryColor: ColorConst.lightPrimaryColor,
      highlightColor: ColorConst.lightHighlightColor,
      backgroundColor: ColorConst.lightBackgroundColor,
      cardColor: ColorConst.lightCardColor,
      canvasColor: ColorConst.lightCanvasColor,
      bottomAppBarColor: ColorConst.lightBottomAppBarColor,
      errorColor: ColorConst.errorColor,
      dividerColor: ColorConst.lightDividerColor,
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
