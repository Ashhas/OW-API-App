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
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.06,
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: isPrivateProfile
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    Constants.publicLabel,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              ],
            ),
    );
  }
}
