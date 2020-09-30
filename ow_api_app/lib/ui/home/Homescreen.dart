import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ow_api_app/data/models/UserProfile.dart';
import 'package:ow_api_app/ui/home/widget/ProfileDisplayWidget.dart';
import 'package:ow_api_app/ui/home/widget/ProfileViewWidget.dart';
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
              )));
        });
  }

  Widget buildBody(viewModel) {
    return Container(
        child: Center(
            child: ProfileViewWidget(
      viewModel: viewModel,
    )));

//    return Container(
//        child: Center(
//            child: ProfileViewWidget(
//      viewModel: viewModel,
//    )));
  }
}
