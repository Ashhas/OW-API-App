import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/ui/home/recolor_profile_display_widget.dart';
import 'package:ow_api_app/ui/home/widget/error_ui_widget.dart';

class HomePage extends StatefulWidget {
  final PersistentTabController navBarController;
  final HomeBloc homeBloc;

  const HomePage({this.navBarController, this.homeBloc}) : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  int profileIndex;
  Box _accountInfoBox;
  AccountModel fetchedAccount;

  @override
  void initState() {
    super.initState();

    _checkInternetConnection();
  }

  Future _checkInternetConnection() async {
    //Internet Connection Stream
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      widget.homeBloc.add(OfflineConnectionEvent());
    } else {
      _init();
      widget.homeBloc.add(OnlineConnectionEvent());
    }
  }

  @override
  void dispose() {
    super.dispose();
    Hive.close();
  }

  Future _init() async {
    // Initialize the current ProfileIndex
    profileIndex = 0;

    // Create DB
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    // Open DB
    _accountInfoBox = await Hive.openBox('accountBox');

    //Create Fake Data
    var account1 =
        AccountModel(1, "Ashhas#2396", "Ashhas", "pc", DateTime.now());
    _accountInfoBox.add(account1);
    var account2 =
        AccountModel(6, "JetLiTe#2341", "JetLiTe", "pc", DateTime.now());
    _accountInfoBox.add(account2);
    var account3 =
        AccountModel(3, "Mjolnir#21534", "Mjolnir", "pc", DateTime.now());
    _accountInfoBox.add(account3);
    var account4 =
        AccountModel(2, "Venomflash#2745", "Venomflash", "pc", DateTime.now());
    _accountInfoBox.add(account4);
    var account5 =
        AccountModel(7, "JMPJNS#2306", "JMPJNS", "pc", DateTime.now());
    _accountInfoBox.add(account5);

    // Start FetchDataEvent with mainAccountId
    fetchedAccount = _accountInfoBox.getAt(0);
    widget.homeBloc.add(FetchProfileEvent(
        profileId: fetchedAccount.battleNetId,
        platformId: fetchedAccount.platformId));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is OnlineConnectionState) {
            _init();
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is OfflineConnectionState) {
              return buildOfflineWidget();
            } else if (state is ProfileLoadingState) {
              return buildLoadingWidget();
            } else if (state is ProfileLoadedState) {
              return RecolorProfileDisplayWidget(
                profileDbIndex: profileIndex,
                profileStats: state.profileStats,
                profileBloc: widget.homeBloc,
                accountInfoDb: _accountInfoBox,
                navBarController: widget.navBarController,
              );
            } else if (state is HomeErrorState) {
              return ErrorUiWidget(state.exception);
            } else
              return buildOfflineWidget();
          },
        ),
      ),
    );
  }

  Widget buildLoadingWidget() {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: CircularProgressIndicator(
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
