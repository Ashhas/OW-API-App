import 'package:flutter/material.dart';
import 'package:ow_api_app/util/constants/color_const.dart';

class FontConst {
  static final BOLD = TextStyle(
    fontWeight: FontWeight.w700,
  );

  static final REGULAR = TextStyle(
    fontWeight: FontWeight.w400,
  );

  //LARGE
  static final LARGE_NAME_TITLE =
      BOLD.copyWith(fontSize: 25, color: ColorConst.darkPrimaryTextColor);

  //LARGE TILE
  static final LARGE_TILE = BOLD.copyWith(fontSize: 21);
  static final LARGE_TILE_WHITE =
      LARGE_TILE.copyWith(color: ColorConst.lightPrimaryTextColor);

  //REGULAR
  static final REGULAR_DEFAULT_BLACK =
      REGULAR.copyWith(fontSize: 15, color: ColorConst.lightPrimaryTextColor);
  static final REGULAR_SMALL_BLACK =
      REGULAR.copyWith(fontSize: 14, color: ColorConst.lightPrimaryTextColor);
  static final REGULAR_TILE_BLACK =
      REGULAR.copyWith(fontSize: 16, color: ColorConst.lightPrimaryTextColor);

  //REGULAR
  static final BOLD_TITLE_VIEW_BLACK =
      BOLD.copyWith(fontSize: 15, color: ColorConst.lightPrimaryTextColor);

  static final REGULAR_ERROR =
      REGULAR.copyWith(fontSize: 14, color: ColorConst.errorColor);
}
