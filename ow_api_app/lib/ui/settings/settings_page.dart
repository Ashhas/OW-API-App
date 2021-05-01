import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildAvailableAccountsWidget(
                  screenBloc, _accountInfoBox, widget.navBarController),
              SizedBox(
                height: 20,
              ),
              _buildMainAccountTile(),
              SizedBox(
                height: 15,
              ),
              _buildVersionTile(),
              _buildLibrariesTile(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        GlobalVariables.settingsPageTitle,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "TitilliumWeb",
            fontWeight: FontWeight.w500,
            fontSize: 25),
      ),
    );
  }

  Widget _buildAvailableAccountsWidget(SettingsBloc screenBloc,
      Box accountInfoBox, PersistentTabController navBarController) {
    return BlocListener<SettingsBloc, SettingsState>(
        listener: (BuildContext context, SettingsState state) {
          if (state is ProfileSwitchedState) {
            print(state.props);
            widget.navBarController.jumpToTab(0);
          }
        },
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Card(
              color: Theme.of(context).buttonColor,
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: Hive.box('accountBox').listenable(),
                    builder: (context, box, widget) {
                      if (box.values.isEmpty)
                        return ListTile(
                            title: Text(GlobalVariables.settingsNoAccountTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "TitilliumWeb",
                                  fontWeight: FontWeight.w500,
                                )),
                            enabled: true,
                            tileColor: Theme.of(context).buttonColor);

                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: box.values.length,
                        itemBuilder: (context, index) {
                          AccountModel account = box.getAt(index);
                          return ListTile(
                            title: Text(account.battleNetId,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "TitilliumWeb",
                                  fontWeight: FontWeight.w500,
                                )),
                            dense: true,
                            tileColor: Theme.of(context).buttonColor,
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
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: 200,
                    child: TextButton(
                      onPressed: () {
                        pushNewScreen(
                          context,
                          screen: AddProfilePage(_accountInfoBox, screenBloc),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
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
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  Widget _buildMainAccountTile() {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
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
            tileColor: Theme.of(context).buttonColor));
  }

  Widget _buildVersionTile() {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
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
            tileColor: Theme.of(context).buttonColor));
  }

  Widget _buildLibrariesTile() {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
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
            tileColor: Theme.of(context).buttonColor));
  }
}
