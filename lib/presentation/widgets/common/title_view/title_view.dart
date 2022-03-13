import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  final String title;
  final double paddingTop;
  final double paddingBottom;

  const TitleView({
    Key? key,
    required this.title,
    this.paddingTop = 20,
    this.paddingBottom = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
        ],
      ),
    );
  }
}
