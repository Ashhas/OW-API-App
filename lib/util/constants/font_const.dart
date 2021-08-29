import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ow_api_app/util/constants/color_const.dart';

class FontConst {
  static final BOLD = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontWeight: FontWeight.w700,
    ),
  );

  static final REGULAR = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontWeight: FontWeight.w400,
    ),
  );

  //AppBar Fonts
  static final BOLD_APP_BAR_TITLE_WHITE =
      BOLD.copyWith(fontSize: 20, color: ColorConst.darkPrimaryTextColor);

  //Title ID Fonts
  static final BOLD_TITLE_ID_WHITE =
      BOLD.copyWith(fontSize: 25, color: ColorConst.darkPrimaryTextColor);

  //Rank Number Fonts
  static final BOLD_RANK_NUMBER_BLACK =
      BOLD.copyWith(fontSize: 15, color: ColorConst.lightPrimaryTextColor);

  //Body Fonts
  static final REGULAR_BODY_BIG_BLACK =
      REGULAR.copyWith(fontSize: 15, color: ColorConst.lightPrimaryTextColor);
  static final REGULAR_BODY_SMALL_BLACK =
      REGULAR.copyWith(fontSize: 14, color: ColorConst.lightPrimaryTextColor);

  //Tile Fonts
  static final REGULAR_TILE_BLACK =
      REGULAR.copyWith(fontSize: 16, color: ColorConst.lightPrimaryTextColor);
  static final REGULAR_TILE_WHITE =
      REGULAR.copyWith(fontSize: 15, color: ColorConst.darkPrimaryTextColor);

  //Title View Fonts
  static final BOLD_TITLE_VIEW_BLACK =
      BOLD.copyWith(fontSize: 15, color: ColorConst.lightPrimaryTextColor);

  //Error Fonts
  static final REGULAR_ERROR =
      REGULAR.copyWith(fontSize: 14, color: ColorConst.errorColor);
}
