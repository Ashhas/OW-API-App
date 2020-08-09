import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ow_api_app/data/models/UserProfile.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

import 'HomeScreenViewModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return new _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  UserProfile currentUser;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeScreenViewModel>.withConsumer(
        viewModelBuilder: () => HomeScreenViewModel(),
        builder: (context, viewModel, child) {
          return Container(
              color: Colors.white,
              child: SafeArea(
                  child: Scaffold(
                appBar: buildAppBar(),
                body: buildBody(viewModel),
              )));
        });
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("OW API"),
    );
  }

  Widget buildBody(viewModel) {

    return Container(child: Center(child: profileDataWidget(viewModel)));
  }

  buildDataWidget(viewModel) {
    UserProfile currentUser = viewModel.currentUser;

    if (currentUser == null)
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "${viewModel.messageToShow}",
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

  profileDataWidget(viewModel) {
    UserProfile currentUser = viewModel.currentUser;

    return new Stack(
      children: <Widget>[
        Positioned(
          width: 400.0,
          top: MediaQuery.of(context).size.height / 5,
          child: Column(
            children: <Widget>[
              Container(
                width: 150.0,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(currentUser.icon),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(75.0))),
              )
            ],
          ),
        )
      ],
    );
  }
}
