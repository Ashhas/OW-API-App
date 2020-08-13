import 'package:flutter/material.dart';
import 'package:ow_api_app/data/models/UserProfile.dart';

import 'RankRatingWidget.dart';

class ProfileDisplayWidget extends StatefulWidget {
  final UserProfile currentUser;

  const ProfileDisplayWidget({Key key, @required this.currentUser})
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
                      image: NetworkImage(widget.currentUser.icon),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                widget.currentUser.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                    color: Color.fromRGBO(48, 51, 66, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RankRatingWidget(
                          rankRating:
                              widget.currentUser.ratings.tank.level.toString(),
                          rankRole: "Tank",
                          rankRatingIcon:
                              widget.currentUser.ratings.tank.rankIcon,
                          rankRoleIcon:
                              widget.currentUser.ratings.tank.roleIcon,
                        ),
                        RankRatingWidget(
                          rankRating: widget.currentUser.ratings.damage.level
                              .toString(),
                          rankRole: "Damage",
                          rankRatingIcon:
                              widget.currentUser.ratings.damage.rankIcon,
                          rankRoleIcon:
                              widget.currentUser.ratings.damage.roleIcon,
                        ),
                        RankRatingWidget(
                          rankRating: widget.currentUser.ratings.support.level
                              .toString(),
                          rankRole: "Support",
                          rankRatingIcon:
                              widget.currentUser.ratings.support.rankIcon,
                          rankRoleIcon:
                              widget.currentUser.ratings.support.roleIcon,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
