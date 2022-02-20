import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_const.dart';

class FontConst {
  static final bold = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w700,
    ),
  );

  static final medium = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
    ),
  );

  static final regular = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w400,
    ),
  );

  //AppBar Fonts
  static final BOLD_APP_BAR_TITLE_WHITE = bold.copyWith(
    fontSize: 20,
    color: ColorConst.darkPrimaryTextColor,
  );

  //Title ID Fonts
  static final BOLD_TITLE_ID_WHITE = bold.copyWith(
    fontSize: 25,
    color: ColorConst.darkPrimaryTextColor,
  );

  //Rank Number Fonts
  static final BOLD_RANK_NUMBER_BLACK = bold.copyWith(
    fontSize: 15,
    color: ColorConst.lightPrimaryTextColor,
  );

  //Body Fonts
  static final REGULAR_BODY_BIG_BLACK = medium.copyWith(
    fontSize: 14,
    color: ColorConst.lightPrimaryTextColor,
  );
  static final REGULAR_BODY_SMALL_BLACK = medium.copyWith(
    fontSize: 14,
    color: ColorConst.lightPrimaryTextColor,
  );

  //Tile Fonts
  static final REGULAR_TILE_BLACK = regular.copyWith(
    fontSize: 16,
    color: ColorConst.lightPrimaryTextColor,
  );
  static final REGULAR_TILE_WHITE = regular.copyWith(
    fontSize: 15,
    color: ColorConst.darkPrimaryTextColor,
  );

  //Title View Fonts
  static final BOLD_TITLE_VIEW_BLACK = bold.copyWith(
    fontSize: 16,
    color: ColorConst.lightPrimaryTextColor,
  );

  //Error Fonts
  static final REGULAR_ERROR = regular.copyWith(
    fontSize: 14,
    color: ColorConst.errorColor,
  );
}
