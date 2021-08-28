import 'package:flutter/material.dart';

class HomeLoadingScreen extends StatelessWidget {
  const HomeLoadingScreen() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: CircularProgressIndicator(
          valueColor:
              new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          backgroundColor: Theme.of(context).shadowColor,
        ),
      ),
    );
  }
}
