import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ow_api_app/services/api_provider.dart';
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
  String _skillrating = "nothing";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mainscreen"),
        ),
        body: new Container(
            child: new Center(
                child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(_skillrating),
            RaisedButton(
              onPressed: getSkillRating,
            )
          ],
        ))));
  }

  Future getSkillRating() async {
    currentUser = await apiProvider.getUserProfile();
    setState(() {
      _skillrating = currentUser.profileName;
    });
    print(currentUser.profileName);
  }
}
