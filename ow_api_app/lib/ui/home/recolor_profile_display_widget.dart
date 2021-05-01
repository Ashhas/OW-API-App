import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:ow_api_app/ui/home/widget/profile_info_card_widget.dart';
import 'package:ow_api_app/ui/home/widget/profile_most_played_hero_widget.dart';

class RecolorProfileDisplayWidget extends StatefulWidget {
  final PersistentTabController navBarController;

  const RecolorProfileDisplayWidget({@required this.navBarController})
      : super();

  @override
  _ProfileDisplayWidgetState createState() => _ProfileDisplayWidgetState();
}

class _ProfileDisplayWidgetState extends State<RecolorProfileDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ProfileInfoCard(),
            MostPlayedHeroesCard(
              navBarController: widget.navBarController,
            ),
          ],
        ));
  }
}
