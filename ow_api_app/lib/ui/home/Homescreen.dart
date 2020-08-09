import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:ow_api_app/data/models/UserProfile.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

import 'HomeScreenViewModel.dart';
import 'widget/RankRatingWidget.dart';

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
                body: buildBody(viewModel),
                backgroundColor: Color.fromRGBO(45, 49, 74, 1),
              )));
        });
  }

  Widget buildBody(viewModel) {
    return Container(child: Center(child: profileDataWidget(viewModel)));
  }

  profileDataWidget(viewModel) {
    UserProfile currentUser = viewModel.currentUser;

    return new Stack(
      children: <Widget>[
        Positioned(
          width: 400.0,
          top: MediaQuery.of(context).size.height / 8,
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
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                currentUser.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RankRatingWidget(
                    rankRating: currentUser.rating.toString(),
                    rankRole: "Tank",
                    rankRatingIcon: currentUser.ratingIcon,
                    rankRoleIcon: currentUser.ratingIcon,
                  ),
                  RankRatingWidget(
                    rankRating: currentUser.ratings.damage.level.toString(),
                    rankRole: "Damage",
                    rankRatingIcon: currentUser.ratings.damage.rankIcon,
                    rankRoleIcon: currentUser.ratings.damage.roleIcon,
                  ),
                  RankRatingWidget(
                    rankRating: currentUser.ratings.support.level.toString(),
                    rankRole: "Support",
                    rankRatingIcon: currentUser.ratings.support.rankIcon,
                    rankRoleIcon: currentUser.ratings.support.roleIcon,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
