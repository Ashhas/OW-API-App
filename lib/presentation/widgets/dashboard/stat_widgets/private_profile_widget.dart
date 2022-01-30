import 'package:flutter/material.dart';

class PrivateProfileWidget extends StatelessWidget {
  const PrivateProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.lock,
        color: Theme.of(context).buttonColor,
      ),
    );
  }
}
