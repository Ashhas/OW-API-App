import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ow_api_app/data/UserProfile.dart';

class Mainscreen extends StatefulWidget {
  @override
  _MainscreenState createState() {
    return new _MainscreenState();
  }
}

class _MainscreenState extends State<Mainscreen> {
  UserProfile currentUser;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mainscreen"),
      ),
      body: Container(child: Center(child: buildDataWidget())),
      floatingActionButton: FloatingActionButton(
        child: isLoading
            ? CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            : Icon(Icons.cloud_download),
        tooltip: "Get Data from API",
        onPressed: () => getUserProfileData(),
      ),
    );
  }

  Future<UserProfile> getUserProfileData() async {
    setState(() {
      isLoading = true;
    });

    const String API_URL = "https://ow-api.com/v3/stats/pc/Ashhas-2396/profile";
    var response = await http.get(Uri.parse(API_URL));
    var parsedJson = await json.decode(response.body);

    setState(() {
      currentUser = UserProfile.fromJson(parsedJson);
      isLoading = false;
    });
  }

  buildDataWidget() {
    if (currentUser == null)
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Press the floating action button to get data",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      );
    else {
      return Text(
        "Username : ${currentUser.name}\n"
        "Support Ranking : ${currentUser.ratings.support.level}\n"
        "Damage Ranking : ${currentUser.ratings.damage.level}\n",
        style: TextStyle(fontSize: 18),
      );
    }
  }
}
