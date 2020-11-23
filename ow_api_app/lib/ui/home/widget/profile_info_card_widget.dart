import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';

import 'package:ow_api_app/bloc/profile/profile_bloc.dart';
import 'package:ow_api_app/bloc/profile/profile_event.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/data/model/profile_model.dart';

class ProfileInfoCard extends StatefulWidget {
  final int profileDbIndex;
  final Profile profileStats;
  final ProfileBloc profileBloc;
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
  ProfileBloc screenBloc;
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
                        CustomPopupMenu(
                          child: Container(
                            child: Icon(
                              Icons.contacts,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(20),
                          ),
                          menuBuilder: () => ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              color: const Color(0xFF4C4C4C),
                              child: ValueListenableBuilder(
                                valueListenable:
                                    Hive.box('accountBox').listenable(),
                                builder: (context, box, widget) {
                                  if (box.values.isEmpty)
                                    return Center(
                                      child: Text("No Accounts"),
                                    );
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: box.values.length,
                                    itemBuilder: (context, index) {
                                      AccountModel account = box.getAt(index);
                                      return Container(
                                        color: Colors.white,
                                        child: ListTile(
                                          title: Text(account.battleNetId),
                                          dense: true,
                                          trailing: IconButton(
                                            icon: Icon(Icons.close),
                                            iconSize: 25,
                                            onPressed: () =>
                                                accountInfoDb.deleteAt(index),
                                          ),
                                          onTap: () => screenBloc.add(
                                              FetchProfileEvent(
                                                  profileId:
                                                      account.battleNetId,
                                                  platformId:
                                                      account.platformId)),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          pressType: PressType.singleClick,
                          verticalMargin: -20,
                          horizontalMargin: 110,
//              controller: _controller,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Competitive Time Played ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "250 HRS",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
            SizedBox(height: 17),
          ],
        ));
  }
}
