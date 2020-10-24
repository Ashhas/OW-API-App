import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ow_api_app/bloc/profile/profile_event.dart';

import 'RankRatingWidget.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/bloc/profile/profile_bloc.dart';

class ProfileDisplayWidget extends StatefulWidget {
  final Profile currentProfile;
  final ProfileBloc profileBloc;

  const ProfileDisplayWidget(
      {Key key, @required this.currentProfile, @required this.profileBloc})
      : super(key: key);

  @override
  _ProfileDisplayWidgetState createState() => _ProfileDisplayWidgetState();
}

class _ProfileDisplayWidgetState extends State<ProfileDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(53, 57, 60, 1.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 45, bottom: 5, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 39,
                        backgroundImage: NetworkImage(widget.currentProfile.eu
                            .stats.competitive.overallStats.avatar),
                      ),
                      Positioned(
                        top: 63,
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: Chip(
                          label: Text(
                            widget.currentProfile.eu.stats.competitive
                                    .overallStats.prestige
                                    .toString() +
                                widget.currentProfile.eu.stats.competitive
                                    .overallStats.level
                                    .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blueGrey,
                          shape: StadiumBorder(
                              side: BorderSide(color: Colors.white)),
                          labelPadding: EdgeInsets.only(
                            top: -9,
                            left: 3,
                            right: 4,
                            bottom: 5,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Ashhas",
                          style: TextStyle(
                              fontFamily: "TitilliumWeb-Bold",
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        RaisedButton(
                            onPressed: () =>
                                widget.profileBloc.add(FetchProfileEvent()),
                            child: Text(
                              "Reload",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color.fromRGBO(101, 105, 108, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: RankRatingWidget(
                  profileStats: widget.currentProfile,
                )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 241, 241, 1.0),
//                    borderRadius: BorderRadius.only(
//                      topRight: Radius.circular(30.0),
//                      topLeft: Radius.circular(30.0),
//                    )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[Container()],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
