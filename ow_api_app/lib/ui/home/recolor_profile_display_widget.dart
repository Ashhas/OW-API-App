import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/ui/home/widget/profile_info_card_widget.dart';
import 'package:ow_api_app/ui/home/widget/title_view.dart';

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
                Expanded(
                  child: Container(
                    color: Color.fromRGBO(24, 30, 36, 1.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(
                          aspectRatio: 5.6 / 3,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Card(
                              color: Color.fromRGBO(28, 42, 53, 1.0),
                              elevation: 15,
                              child: Column(
                                children: [
                                  TitleView(
                                    titleTxt: "Most Played Heroes",
                                    subTxt: "See All",
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        bottom: 15,
                                        right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.blue,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Card(
                                              color: Color.fromRGBO(
                                                  28, 39, 44, 1.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Tracer",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "TitilliumWeb",
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "4 HRS",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "TitilliumWeb",
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image(
                                                          height: 70,
                                                          width: 70,
                                                          image: NetworkImage(
                                                              profileStats
                                                                  .icon))),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.blue,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Card(
                                              color: Color.fromRGBO(
                                                  28, 39, 44, 1.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Tracer",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "TitilliumWeb",
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "4 HRS",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "TitilliumWeb",
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image(
                                                          height: 70,
                                                          width: 70,
                                                          image: NetworkImage(
                                                              profileStats
                                                                  .icon))),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.blue,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Card(
                                              color: Color.fromRGBO(
                                                  28, 39, 44, 1.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Tracer",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "TitilliumWeb",
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "4 HRS",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "TitilliumWeb",
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image(
                                                          height: 70,
                                                          width: 70,
                                                          image: NetworkImage(
                                                              profileStats
                                                                  .icon))),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), //last one
                ),
              ],
            )));
  }
}
