import 'package:flutter/material.dart';
import 'package:ow_api_app/network/api_provider.dart';
import 'package:ow_api_app/data/UserProfile.dart';

class Mainscreen extends StatefulWidget {
  @override
  _MainscreenState createState() {
    return new _MainscreenState();
  }
}

class _MainscreenState extends State<Mainscreen> {
  UserApiProvider apiProvider = new UserApiProvider();
  UserProfile currentUser = new UserProfile();
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mainscreen"),
        ),
        body: FutureBuilder(
          future: getSkillRating(),
          builder: (context, snapshot) {
            currentUser = snapshot.data;

            if (!snapshot.hasData) {
              print("has No Data");
              return SizedBox();
            } else {
              print("has Data");
              return Container(
                child: Column(
                  children: <Widget>[
                    Text(currentUser.profileName),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 48,
                          width: 2,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                        ),
                        Text(currentUser.profileLevel.toString()),
                        Text(currentUser.skillRating.toString()),
                        Text(currentUser.allGamesWon.toString())
                      ],
                    )
                  ],
                ),
              );
            }
          },
        ));
  }

  Future<UserProfile> getSkillRating() async {
    return await apiProvider.getUserProfile();
  }
}
