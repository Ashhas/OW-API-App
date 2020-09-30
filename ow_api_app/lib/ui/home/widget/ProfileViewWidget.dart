import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ow_api_app/data/models/UserProfile.dart';
import 'package:ow_api_app/ui/home/HomeScreenViewModel.dart';

import 'RankRatingWidget.dart';

class ProfileViewWidget extends StatefulWidget {
  final HomeScreenViewModel viewModel;

  const ProfileViewWidget({Key key, @required this.viewModel})
      : super(key: key);

  @override
  _ProfileViewWidgetState createState() => _ProfileViewWidgetState();
}

class _ProfileViewWidgetState extends State<ProfileViewWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.viewModel.isLoading
        ? Container(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Container(
                  child: Padding(
                padding:
                    EdgeInsets.only(top: 57, bottom: 12, left: 15, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://d15f34w2p8l1cc.cloudfront.net/overwatch/dd8894f291790e7a5be99672c470b05b8e70057772a24734d1c9aaee87d06f08.png"),
                          radius: 35,
                        ),
                      ],
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.viewModel.currentUser.name,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Times",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RaisedButton(
                              onPressed: () {},
                              child: Text("Reload"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)))
                        ],
                      ),
                    )
                  ],
                ),
              )),
              Padding(
                padding: EdgeInsets.only(left: 3.0, right: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RankRatingWidget(
                      rankRating: widget
                          .viewModel.currentUser.ratings.tank.level
                          .toString(),
                      rankRole: "Tank",
                      rankRatingIcon:
                          widget.viewModel.currentUser.ratings.tank.rankIcon,
                      rankRoleIcon:
                          widget.viewModel.currentUser.ratings.tank.roleIcon,
                    ),
                    RankRatingWidget(
                      rankRating: widget
                          .viewModel.currentUser.ratings.damage.level
                          .toString(),
                      rankRole: "Damage",
                      rankRatingIcon:
                          widget.viewModel.currentUser.ratings.damage.rankIcon,
                      rankRoleIcon:
                          widget.viewModel.currentUser.ratings.damage.roleIcon,
                    ),
                    RankRatingWidget(
                      rankRating: widget
                          .viewModel.currentUser.ratings.support.level
                          .toString(),
                      rankRole: "Support",
                      rankRatingIcon:
                          widget.viewModel.currentUser.ratings.support.rankIcon,
                      rankRoleIcon:
                          widget.viewModel.currentUser.ratings.support.roleIcon,
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
