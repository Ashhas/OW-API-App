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
                color: Color.fromRGBO(24, 30, 36, 1.0),
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
              color: Color.fromRGBO(24, 30, 36, 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AspectRatio(
                    aspectRatio: 5.6 / 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Card(
                        color: Color.fromRGBO(28, 42, 53, 1.0),
                        elevation: 15,
                        child: Column(
                          children: [
                            TitleView(
                              titleTxt: "Most Played Heroes",
                              subTxt: "See All",
                              navBarController: widget.navBarController,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, bottom: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.blue,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Card(
                                        color: Color.fromRGBO(28, 39, 44, 1.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Tracer",
                                              style: TextStyle(
                                                  fontFamily: "TitilliumWeb",
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "4 HRS",
                                              style: TextStyle(
                                                  fontFamily: "TitilliumWeb",
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image(
                                                    height: 70,
                                                    width: 70,
                                                    image: NetworkImage(widget
                                                        .profileStatistics
                                                        .icon))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.blue,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Card(
                                        color: Color.fromRGBO(28, 39, 44, 1.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Tracer",
                                              style: TextStyle(
                                                  fontFamily: "TitilliumWeb",
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "4 HRS",
                                              style: TextStyle(
                                                  fontFamily: "TitilliumWeb",
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image(
                                                    height: 70,
                                                    width: 70,
                                                    image: NetworkImage(widget
                                                        .profileStatistics
                                                        .icon))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.blue,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Card(
                                        color: Color.fromRGBO(28, 39, 44, 1.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Tracer",
                                              style: TextStyle(
                                                  fontFamily: "TitilliumWeb",
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "4 HRS",
                                              style: TextStyle(
                                                  fontFamily: "TitilliumWeb",
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image(
                                                    height: 70,
                                                    width: 70,
                                                    image: NetworkImage(widget
                                                        .profileStatistics
                                                        .icon))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), //last one
          );
  }
}
