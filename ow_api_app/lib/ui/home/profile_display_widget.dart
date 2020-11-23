import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:ow_api_app/ui/home/widget/profile_info_card_widget.dart';

import 'widget/rank_rating_widget.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/bloc/profile/profile_bloc.dart';
import 'package:ow_api_app/bloc/profile/profile_event.dart';
import 'package:ow_api_app/data/model/account.model.dart';

class ProfileDisplayWidget extends StatefulWidget {
  final int profileDbIndex;
  final Profile profileStats;
  final ProfileBloc profileBloc;
  final Box accountInfoDb;

  const ProfileDisplayWidget({
    Key key,
    @required this.profileDbIndex,
    @required this.profileStats,
    @required this.profileBloc,
    @required this.accountInfoDb,
  }) : super(key: key);

  @override
  _ProfileDisplayWidgetState createState() => _ProfileDisplayWidgetState();
}

class _ProfileDisplayWidgetState extends State<ProfileDisplayWidget> {
  AccountModel currentAccount;
  int profileDbIndex;
  Profile profileStats;
  ProfileBloc screenBloc;
  Box accountInfoDb;

  @override
  Widget build(BuildContext context) {
    profileDbIndex = widget.profileDbIndex;
    profileStats = widget.profileStats;
    screenBloc = widget.profileBloc;
    accountInfoDb = widget.accountInfoDb;
    currentAccount = accountInfoDb.getAt(profileDbIndex);

    return Container(
        color: Color.fromRGBO(28, 39, 44, 1.0),
        child: Column(
          children: <Widget>[
            ProfileInfoCard(
              profileDbIndex: profileDbIndex,
              profileStats: profileStats,
              profileBloc: screenBloc,
              accountInfoDb: accountInfoDb,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(48, 68, 78, 1.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      profileStats.private == true
                          ? Center(
                              child: Icon(
                              Icons.lock_outlined,
                              color: Colors.white,
                            ))
                          : Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: RankRatingWidget(
                                      profileStats: profileStats,
                                    ))
                              ],
                            )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
