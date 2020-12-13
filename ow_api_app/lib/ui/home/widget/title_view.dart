import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final PersistentTabController navBarController;

  const TitleView(
      {Key key,
      @required this.titleTxt,
      @required this.subTxt,
      @required this.navBarController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                titleTxt,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "TitilliumWeb",
                    fontSize: 15,
                    letterSpacing: 0.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            InkWell(
              focusColor: Colors.lightBlue,
              highlightColor: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: () {
                navBarController.jumpToTab(1);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      subTxt,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: "TitilliumWeb",
                          fontSize: 15,
                          letterSpacing: 0.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 38,
                      width: 26,
                      child: Icon(Icons.arrow_forward,
                          size: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
