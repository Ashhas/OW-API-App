import 'package:flutter/material.dart';

class PrivateProfileWidget extends StatelessWidget {
  const PrivateProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.lock,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}
