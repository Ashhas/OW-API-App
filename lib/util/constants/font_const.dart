import 'package:flutter/material.dart';
import 'package:ow_api_app/util/constants/color_const.dart';

class FontConst {
  static final LARGE = TextStyle(
    fontWeight: FontWeight.w700,
    color: ColorConst.lightPrimaryTextColor,
  );

  static final REGULAR = TextStyle(
    fontWeight: FontWeight.w400,
    color: ColorConst.lightPrimaryTextColor,
  );

  //LARGE
  static final LARGE_NAME_TITLE =
      LARGE.copyWith(fontSize: 25, color: ColorConst.darkPrimaryTextColor);

  static final LARGE_TILE = LARGE.copyWith(fontSize: 21);
  static final LARGE_TILE_WHITE =
      LARGE_TILE.copyWith(color: ColorConst.lightPrimaryTextColor);
  static final LARGE_TILE_DARK =
      LARGE_TILE.copyWith(color: ColorConst.darkPrimaryTextColor);

  //REGULAR
  static final REGULAR_DEFAULT = REGULAR.copyWith(fontSize: 15);
  static final REGULAR_SMALL = REGULAR.copyWith(fontSize: 14);

  static final REGULAR_ERROR =
      REGULAR.copyWith(fontSize: 14, color: ColorConst.errorColor);
}
