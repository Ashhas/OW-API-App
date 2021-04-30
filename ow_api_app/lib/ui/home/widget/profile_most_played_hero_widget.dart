import 'package:flutter/material.dart';

import 'package:ow_api_app/ui/home/widget/title_view.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MostPlayedHeroesCard extends StatefulWidget {
  final PersistentTabController navBarController;
  final Profile profileStatistics;

  const MostPlayedHeroesCard(
      {@required this.profileStatistics, @required this.navBarController})
      : super();

  @override
  _MostPlayedHeroesCardState createState() => _MostPlayedHeroesCardState();
}

class _MostPlayedHeroesCardState extends State<MostPlayedHeroesCard> {
  @override
  Widget build(BuildContext context) {
    return widget.profileStatistics.private
        ? Expanded(
            child: Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ])))
        : Expanded(
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ), //last one
          );
  }
}
