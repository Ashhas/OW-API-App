import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  final String title;

  const TitleView({this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
