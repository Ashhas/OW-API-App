import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/ui/home/widget/profile_info_card_widget.dart';
import 'package:ow_api_app/ui/home/widget/profile_most_played_hero_widget.dart';

import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/data/model/account.model.dart';

class RecolorProfileDisplayWidget extends StatefulWidget {
  final int profileDbIndex;
  final Profile profileStats;
  final HomeBloc profileBloc;
  final Box accountInfoDb;

  const RecolorProfileDisplayWidget({
    Key key,
    @required this.profileDbIndex,
    @required this.profileStats,
    @required this.profileBloc,
    @required this.accountInfoDb,
  }) : super(key: key);

  @override
  _ProfileDisplayWidgetState createState() => _ProfileDisplayWidgetState();
}

class _ProfileDisplayWidgetState extends State<RecolorProfileDisplayWidget> {
  AccountModel currentAccount;
  int profileDbIndex;
  Profile profileStats;
  HomeBloc screenBloc;
  Box accountInfoDb;

  @override
  Widget build(BuildContext context) {
    profileDbIndex = widget.profileDbIndex;
    profileStats = widget.profileStats;
    screenBloc = widget.profileBloc;
    accountInfoDb = widget.accountInfoDb;
    currentAccount = accountInfoDb.getAt(profileDbIndex);

    return BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is ProfileSwitchedState) {
            screenBloc.add(FetchProfileEvent(
                profileId: state.profileId, platformId: state.platformId));
          }
        },
        child: Container(
            color: Color.fromRGBO(28, 42, 53, 1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ProfileInfoCard(
                  profileDbIndex: profileDbIndex,
                  profileStats: profileStats,
                  profileBloc: screenBloc,
                  accountInfoDb: accountInfoDb,
                ),
                MostPlayedHeroesCard(
                  profileStatistics: profileStats,
                ),
              ],
            )));
  }
}
