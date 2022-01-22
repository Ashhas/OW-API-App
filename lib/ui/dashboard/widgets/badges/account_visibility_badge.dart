import 'package:flutter/material.dart';
import 'package:ow_api_app/theme/color_const.dart';

class AccountVisibilityBadge extends StatelessWidget {
  final bool isPrivateProfile;

  const AccountVisibilityBadge({this.isPrivateProfile}) : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: isPrivateProfile != true
          ? Row(
              children: [
                Text(
                  "Public",
                  style: TextStyle(color: ColorConst.lightPrimaryTextColor),
                ),
                Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              ],
            )
          : Row(
              children: [
                Text(
                  "Private",
                  style: TextStyle(color: ColorConst.lightPrimaryTextColor),
                ),
                Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ],
            ),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).hintColor,
      ),
      onPressed: () {},
    );
  }
}
