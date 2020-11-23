import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'widget/profile_display_widget.dart';
import 'package:ow_api_app/bloc/profile/profile_bloc.dart';
import 'package:ow_api_app/bloc/profile/profile_event.dart';
import 'package:ow_api_app/bloc/profile/profile_state.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/util/api_exception_mapper.dart';
import 'package:ow_api_app/ui/home/widget/error_ui_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box _accountInfoBox;
  ProfileBloc profileBloc;
  AccountModel fetchedAccount;
  int profileIndex;
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    profileBloc = BlocProvider.of<ProfileBloc>(context);

    if (!initialized) {
      _init();
      initialized = true;
    }
  }

  Future _init() async {
    // Initialize the current ProfileIndex
    profileIndex = 0;

    // Create DB
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(AccountModelAdapter());

    // Open DB
    _accountInfoBox = await Hive.openBox('accountBox');

    //Create Fake Data
    var account1 =
        AccountModel(1, "Ashhas#2396", "Ashhas", "pc", DateTime.now());
    _accountInfoBox.add(account1);
    var account2 =
        AccountModel(2, "Axyos#21653", "Axyos", "pc", DateTime.now());
    _accountInfoBox.add(account2);
    var account3 =
    AccountModel(2, "Venomflash#2745", "Venomflash", "pc", DateTime.now());
    _accountInfoBox.add(account3);

    // Start FetchDataEvent with mainAccountId
    fetchedAccount = _accountInfoBox.getAt(0);
    profileBloc.add(FetchProfileEvent(
        profileId: fetchedAccount.battleNetId,
        platformId: fetchedAccount.platformId));
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
                  profileDbIndex: profileIndex,
                  profileStats: state.profileStats,
                  profileBloc: profileBloc,
                  accountInfoDb: _accountInfoBox,
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
