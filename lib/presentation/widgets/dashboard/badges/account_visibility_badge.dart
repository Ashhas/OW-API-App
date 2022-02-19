import 'package:flutter/material.dart';
import 'package:ow_api_app/utils/constants.dart';

class AccountVisibilityBadge extends StatelessWidget {
  final bool isPrivateProfile;

  const AccountVisibilityBadge({
    Key? key,
    required this.isPrivateProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: isPrivateProfile
          ? Row(
              children: const [
                Text(
                  Constants.privateLabel,
                  style: TextStyle(color: Colors.black),
                ),
                Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ],
            )
          : Row(
              children: const [
                Text(
                  Constants.publicLabel,
                  style: TextStyle(color: Colors.black),
                ),
                Icon(
                  Icons.check,
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
