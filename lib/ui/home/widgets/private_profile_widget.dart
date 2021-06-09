import 'package:flutter/material.dart';

class PrivateProfileWidget extends StatelessWidget {
  const PrivateProfileWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          Icons.lock,
          color: Theme.of(context).buttonColor,
        ),
      ],
    );
  }
}
