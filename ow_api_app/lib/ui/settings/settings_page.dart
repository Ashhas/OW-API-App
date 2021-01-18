import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:ow_api_app/data/util/global_variables.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';

import 'add_profile_page.dart';

class SettingsPage extends StatefulWidget {
  final PersistentTabController navBarController;
  final SettingsBloc settingsBloc;

  const SettingsPage({this.navBarController, this.settingsBloc}) : super();

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Box _accountInfoBox;
  SettingsBloc screenBloc;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // Create DB
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    // Open DB
    _accountInfoBox = await Hive.openBox('accountBox');
  }

  @override
  Widget build(BuildContext context) {
    //Creating the BloC for this screen
    screenBloc = widget.settingsBloc;

    return Container(
        color: Color.fromRGBO(24, 30, 36, 1.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildTopTitle(),
              _buildAvailableAccountsWidget(
                  screenBloc, _accountInfoBox, widget.navBarController),
              _buildAddAccountButton(),
              SizedBox(
                height: 30,
              ),
              _buildReportAndSuggestTile(),
              _buildReviewTile(),
              SizedBox(
                height: 15,
              ),
              _buildLibrariesTile(),
              _buildVersionTile(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }

  Widget _buildTopTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 60),
      child: Text(
        GlobalVariables.settingsPageTitle,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "TitilliumWeb",
            fontWeight: FontWeight.w500,
            fontSize: 30),
      ),
    );
  }

  Widget _buildAvailableAccountsWidget(SettingsBloc screenBloc,
      Box accountInfoBox, PersistentTabController navBarController) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (BuildContext context, SettingsState state) {
          if (state is ProfileSwitchedState) {
            print(state.props);
            widget.navBarController.jumpToTab(0);
          }
        },
        child: ValueListenableBuilder(
          valueListenable: Hive.box('accountBox').listenable(),
          builder: (context, box, widget) {
            if (box.values.isEmpty)
              return Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: ListTile(
                      title: Text(GlobalVariables.settingsNoAccountTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "TitilliumWeb",
                            fontWeight: FontWeight.w500,
                          )),
                      enabled: true,
                      tileColor: Color.fromRGBO(28, 42, 53, 1.0)));

            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                AccountModel account = box.getAt(index);
                return Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: ListTile(
                    title: Text(account.battleNetId,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "TitilliumWeb",
                          fontWeight: FontWeight.w500,
                        )),
                    dense: true,
                    tileColor: Color.fromRGBO(28, 42, 53, 1.0),
                    trailing: IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 25,
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          _accountInfoBox.deleteAt(index);
                        });
                      },
                    ),
                    onTap: () => screenBloc.add(ChangeProfileEvent(
                        profileId: account.battleNetId,
                        platformId: account.platformId)),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildAddAccountButton() {
    return FlatButton(
      onPressed: () {
        pushNewScreen(
          context,
          screen: AddProfilePage(_accountInfoBox, screenBloc),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Text(
            "Add Account",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      color: Colors.orange,
    );
  }

  Widget _buildReportAndSuggestTile() {
    return Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: ListTile(
            title: Text(GlobalVariables.settingsFeedbackTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "TitilliumWeb",
                  fontWeight: FontWeight.w500,
                )),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            enabled: true,
            tileColor: Color.fromRGBO(28, 42, 53, 1.0)));
  }

  Widget _buildReviewTile() {
    return Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: ListTile(
            title: Text(GlobalVariables.settingsReviewTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "TitilliumWeb",
                  fontWeight: FontWeight.w500,
                )),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            enabled: true,
            tileColor: Color.fromRGBO(28, 42, 53, 1.0)));
  }

  Widget _buildLibrariesTile() {
    return Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: ListTile(
            title: Text(GlobalVariables.settingsOpenSourceTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "TitilliumWeb",
                  fontWeight: FontWeight.w500,
                )),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            enabled: true,
            tileColor: Color.fromRGBO(28, 42, 53, 1.0)));
  }

  Widget _buildVersionTile() {
    return Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: ListTile(
            title: Text(GlobalVariables.settingsVersionTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "TitilliumWeb",
                  fontWeight: FontWeight.w500,
                )),
            trailing: Text(
              GlobalVariables.settingsVersionNumber,
              style: TextStyle(color: Colors.white),
            ),
            enabled: true,
            tileColor: Color.fromRGBO(28, 42, 53, 1.0)));
  }
}
