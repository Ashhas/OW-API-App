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
  final HomeBloc profileBloc;

  const HomePage({this.navBarController, this.profileBloc}) : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int profileIndex;
  Box _accountInfoBox;
  AccountModel fetchedAccount;

  @override
  void initState() {
    super.initState();

    _init();
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
        AccountModel(2, "Venomflash#2745", "Venomflash", "pc", DateTime.now());
    _accountInfoBox.add(account2);
    var account3 =
        AccountModel(3, "Mjolnir#21534", "Mjolnir", "pc", DateTime.now());
    _accountInfoBox.add(account3);
    var account4 =
        AccountModel(4, "N0rki#1422", "Ashhas", "pc", DateTime.now());
    _accountInfoBox.add(account4);
    var account5 =
        AccountModel(5, "Tafboy#21481", "Tafboy", "pc", DateTime.now());
    _accountInfoBox.add(account5);
    var account6 =
        AccountModel(6, "JetLiTe#2341", "JetLiTe", "pc", DateTime.now());
    _accountInfoBox.add(account6);
    var account7 =
        AccountModel(7, "JMPJNS#2306", "JMPJNS", "pc", DateTime.now());
    _accountInfoBox.add(account7);
    var account8 = AccountModel(8, "Hop#21748", "Hop", "pc", DateTime.now());
    _accountInfoBox.add(account8);

    // Start FetchDataEvent with mainAccountId
    fetchedAccount = _accountInfoBox.getAt(0);
    widget.profileBloc.add(FetchProfileEvent(
        profileId: fetchedAccount.battleNetId,
        platformId: fetchedAccount.platformId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      body: Container(
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {},
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitialState) {
                return buildLoadingWidget();
              } else if (state is ProfileLoadingState) {
                return buildLoadingWidget();
              } else if (state is ProfileLoadedState) {
                return RecolorProfileDisplayWidget(
                  profileDbIndex: profileIndex,
                  profileStats: state.profileStats,
                  profileBloc: widget.profileBloc,
                  accountInfoDb: _accountInfoBox,
                  navBarController: widget.navBarController,
                );
              } else if (state is HomeErrorState) {
                return ErrorUiWidget(state.exception);
              } else
                return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget buildLoadingWidget() {
    return Container(
      color: Color.fromRGBO(28, 42, 53, 1.0),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
