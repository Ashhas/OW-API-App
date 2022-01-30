import 'package:flutter/material.dart';

class AccountVisibilityBadge extends StatelessWidget {
  final bool isPrivateProfile;

  const AccountVisibilityBadge({Key? key, required this.isPrivateProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: isPrivateProfile != true
          ? Row(
              children: const [
                Text(
                  "Public",
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              ],
            )
          : Row(
              children: const [
                Text(
                  "Private",
                  style: TextStyle(color: Colors.grey),
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
