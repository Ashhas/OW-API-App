import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ow_api_app/bloc/profile/profile_event.dart';

import 'RankRatingWidget.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/bloc/profile/profile_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';

class ProfileDisplayWidget extends StatefulWidget {
  final Profile currentProfile;
  final ProfileBloc profileBloc;
  final AccountModel currentAccount;

  const ProfileDisplayWidget(
      {Key key,
      @required this.currentProfile,
      @required this.profileBloc,
      @required this.currentAccount})
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
              padding: EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Color.fromRGBO(223, 143, 38, 1.0),
                        child: CircleAvatar(
                          radius: 39,
                          backgroundImage: NetworkImage(widget.currentProfile.eu
                              .stats.competitive.overallStats.avatar),
                        ),
                      ),
                      Positioned(
                        top: 68,
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
                            left: 5,
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
                          height: 10,
                        ),
                        Text(
                          widget.currentAccount.battleNetId,
                          style: TextStyle(
                              fontFamily: "TitilliumWeb",
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        RaisedButton(
                            onPressed: () => widget.profileBloc.add(
                                FetchProfileEvent(
                                    profileId:
                                        widget.currentAccount.battleNetId)),
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
            SizedBox(height: 25),
            Text("- Competitive Season 23 - ",
                style: TextStyle(
                    fontFamily: "TitilliumWeb",
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: RankRatingWidget(
                  profileStats: widget.currentProfile,
                )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 241, 241, 1.0),
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
