import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';

import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/ui/home/widget/rank_rating_widget.dart';

class ProfileInfoCard extends StatefulWidget {
  final int profileDbIndex;
  final Profile profileStats;
  final HomeBloc profileBloc;
  final Box accountInfoDb;

  const ProfileInfoCard({
    Key key,
    @required this.profileDbIndex,
    @required this.profileStats,
    @required this.profileBloc,
    @required this.accountInfoDb,
  }) : super(key: key);

  @override
  _ProfileInfoCardState createState() => _ProfileInfoCardState();
}

class _ProfileInfoCardState extends State<ProfileInfoCard> {
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

    return Padding(
        padding: EdgeInsets.only(top: 45, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                      height: 110,
                      width: 110,
                      image: NetworkImage(profileStats.icon)),
                ),
                SizedBox(
                  width: 18,
                ),
                Container(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      profileStats.name,
                      style: TextStyle(
                          fontFamily: "TitilliumWeb",
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RaisedButton(
                          child: profileStats.private != true
                              ? Row(
                                  children: [
                                    Text(
                                      "Public",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: Colors.black,
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Text(
                                      "Private",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                          color: Color.fromRGBO(246, 246, 133, 1.0),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            ),
            RankRatingWidget(
              profileStats: profileStats,
            ),
            SizedBox(height: 10),
          ],
        ));
  }
}
