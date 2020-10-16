import 'package:flutter/material.dart';
import 'package:ow_api_app/data/model/profile_model.dart';

import 'RankRatingWidget.dart';

class ProfileDisplayWidget extends StatefulWidget {
  final Profile currentProfile;

  const ProfileDisplayWidget({Key key, @required this.currentProfile})
      : super(key: key);

  @override
  _ProfileDisplayWidgetState createState() => _ProfileDisplayWidgetState();
}

class _ProfileDisplayWidgetState extends State<ProfileDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 120.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(widget.currentProfile.eu.stats
                          .competitive.overallStats.avatar),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Ashhas",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: RankRatingWidget(
                        profileStats: widget.currentProfile,
                      )))
            ],
          ),
        )
      ],
    );
  }
}
