import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'RankRatingWidget.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/bloc/profile/profile_bloc.dart';
import 'package:ow_api_app/bloc/profile/profile_event.dart';
import 'package:ow_api_app/data/model/account.model.dart';

class ProfileDisplayWidget extends StatefulWidget {
  final Profile profile;
  final ProfileBloc profileBloc;
  final Box accountInformation;

  const ProfileDisplayWidget(
      {Key key,
      @required this.profile,
      @required this.profileBloc,
      @required this.accountInformation})
      : super(key: key);

  @override
  _ProfileDisplayWidgetState createState() => _ProfileDisplayWidgetState();
}

class _ProfileDisplayWidgetState extends State<ProfileDisplayWidget> {
  Profile currentProfile;
  ProfileBloc screenBloc;
  Box accountInformationDb;

  @override
  Widget build(BuildContext context) {
    currentProfile = widget.profile;
    screenBloc = widget.profileBloc;
    accountInformationDb = widget.accountInformation;
    return Container(
        color: Color.fromRGBO(53, 57, 60, 1.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Color.fromRGBO(223, 143, 38, 1.0),
                        child: CircleAvatar(
                          radius: 39,
                          backgroundImage: NetworkImage(currentProfile.icon),
                        ),
                      ),
                      Positioned(
                        top: 68,
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: Chip(
                          label: Text(
                            ((currentProfile.prestige * 100) +
                                    currentProfile.level)
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blueGrey,
                          shape: StadiumBorder(
                              side: BorderSide(color: Colors.white)),
                          labelPadding: EdgeInsets.only(
                            top: -9,
                            left: 5,
                            right: 4,
                            bottom: 5,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
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
                          currentProfile.name,
                          style: TextStyle(
                              fontFamily: "TitilliumWeb",
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RaisedButton(
                                onPressed: () => screenBloc.add(
                                    FetchProfileEvent(
                                        profileId: currentProfile.name)),
                                child: Text(
                                  "Reload",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Color.fromRGBO(101, 105, 108, 1.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
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
                                          AccountModel account =
                                              box.getAt(index);
                                          return Container(
                                            color: Colors.white,
                                            child: ListTile(
                                              title: Text(account.battleNetId),
                                              dense: true,
                                              trailing: IconButton(
                                                icon: Icon(Icons.close),
                                                iconSize: 25,
                                                onPressed: () =>
                                                    accountInformationDb
                                                        .deleteAt(index),
                                              ),
                                              onTap: () => screenBloc.add(
                                                  FetchProfileEvent(
                                                      profileId:
                                                          account.battleNetId)),
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
//                              controller: _controller,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Text("- Competitive Season 23 - ",
                style: TextStyle(
                    fontFamily: "TitilliumWeb",
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: RankRatingWidget(
                  profileStats: currentProfile,
                )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 241, 241, 1.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[Container()],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
