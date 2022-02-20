import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Image(
            image: const AssetImage(
              'assets/overwatch-text-logo.png',
            ),
            width: MediaQuery.of(context).size.width * 0.52,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
