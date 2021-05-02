import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ow_api_app/ui/home/widget/profile_info_card_widget.dart';
import 'package:ow_api_app/ui/home/widget/profile_most_played_hero_widget.dart';

class ProfileDisplayWidget extends StatefulWidget {
  const ProfileDisplayWidget() : super();

  @override
  _ProfileDisplayWidgetState createState() => _ProfileDisplayWidgetState();
}

class _ProfileDisplayWidgetState extends State<ProfileDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ProfileInfoCard(),
            MostPlayedHeroesCard(),
          ],
        ));
  }
}
