import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ow_api_app/data/UserProfile.dart';
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
                floatingActionButton: buildFloatingActionButton(viewModel),
              )));
        });
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Networking Like a Pro"),
    );
  }

  Widget buildBody(viewModel) {
    /// building our UI
    /// notice we are observing viewModel.apiResponseModel
    /// Hence buildDataWidget will rebuild when apiResponse changes in ViewModel
    return Container(child: Center(child: buildDataWidget(viewModel)));
  }

  FloatingActionButton buildFloatingActionButton(viewModel) {
    return FloatingActionButton(
      child: viewModel.isLoading
          ? CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
          : Icon(Icons.cloud_download),
      tooltip: "Get Data from API",

      /// Calling our viewModel function
      onPressed: () => viewModel.getUserProfileData(),
    );
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
}
