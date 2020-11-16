import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'widget/ProfileDisplayWidget.dart';
import 'package:ow_api_app/bloc/profile/profile_bloc.dart';
import 'package:ow_api_app/bloc/profile/profile_event.dart';
import 'package:ow_api_app/bloc/profile/profile_state.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/util/ApiExceptionMapper.dart';
import 'package:ow_api_app/ui/home/widget/ErrorUiWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box _accountInfoBox;
  ProfileBloc profileBloc;
  AccountModel mainAccount;

  @override
  void initState() {
    super.initState();
    Hive.registerAdapter(AccountModelAdapter());
    profileBloc = BlocProvider.of<ProfileBloc>(context);

    _init();
  }

  Future _init() async {
    //Create DB
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _accountInfoBox = await Hive.openBox('accountBox');

//    //Create Fake Data
//    var account1 =
//        AccountModel(1, "Ashhas#2396", "Ashhas", "pc", DateTime.now());
//    _accountInfoBox.add(account1);
//    var account2 =
//        AccountModel(2, "Axyos#21653", "Axyos", "ps4", DateTime.now());
//    _accountInfoBox.add(account2);

//    _accountInfoBox.deleteFromDisk();

    //Start FetchDataEvent with mainAccountId
    mainAccount = _accountInfoBox.getAt(0);
    profileBloc.add(FetchProfileEvent(profileId: mainAccount.battleNetId));
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      body: Container(
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text(ApiExceptionMapper.toErrorMessage(state.exception)),
                ),
              );
            }
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileInitialState) {
                return buildLoading();
              } else if (state is ProfileLoadingState) {
                return buildLoading();
              } else if (state is ProfileLoadedState) {
                return ProfileDisplayWidget(
                  profile: state.profileStats,
                  profileBloc: profileBloc,
                  accountInformation: _accountInfoBox,
                );
              } else if (state is ProfileErrorState) {
                return ErrorUiWidget(state.exception);
              } else
                return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
