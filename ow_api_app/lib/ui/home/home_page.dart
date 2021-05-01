import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/ui/home/recolor_profile_display_widget.dart';
import 'package:ow_api_app/ui/home/widget/error_ui_widget.dart';

class HomePage extends StatefulWidget {
  final PersistentTabController navBarController;

  const HomePage({this.navBarController}) : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeStarted());
  }

  @override
  void dispose() {
    super.dispose();
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return buildLoadingWidget();
          } else if (state is ProfileLoadedState) {
            return RecolorProfileDisplayWidget(
              navBarController: widget.navBarController,
            );
          } else if (state is HomeErrorState) {
            return ErrorUiWidget(state.exception);
          } else
            return buildLoadingWidget();
        },
      ),
    );
  }

  Widget buildLoadingWidget() {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: CircularProgressIndicator(
          valueColor:
              new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget buildOfflineWidget() {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_off, color: Colors.white),
          Text(
            "No Internet Connection",
            style: TextStyle(color: Colors.white),
          )
        ],
      )),
    );
  }
}
