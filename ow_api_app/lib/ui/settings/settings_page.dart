import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/ui/settings/screens/open_source_libraries_page.dart';
import 'package:ow_api_app/ui/settings/screens/select_main_account_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:ow_api_app/data/util/strings.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';

import 'screens/add_profile_page.dart';

class SettingsPage extends StatefulWidget {
  final PersistentTabController navBarController;

  const SettingsPage({this.navBarController}) : super();

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SettingsBloc>(context)
        .add(SettingsStarted(navBarController: widget.navBarController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoadedState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildAvailableAccountsWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildMainAccountTile(state.mainAccount),
                  SizedBox(
                    height: 15,
                  ),
                  _buildVersionTile(state.appVersion),
                  _buildLibrariesTile(),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
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

  Widget _buildAvailableAccountsWidget() {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      if (state is SettingsLoadedState) {
        return Padding(
            padding: EdgeInsets.only(left: 10, right: 15),
            child: Card(
              color: Theme.of(context).buttonColor,
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: state.allAccounts.listenable(),
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
                        );

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
                              trailing: IconButton(
                                icon: Icon(Icons.close),
                                iconSize: 25,
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    state.allAccounts.deleteAt(index);
                                  });
                                },
                              ),
                              onTap: () {
                                BlocProvider.of<SettingsBloc>(context).add(
                                    ChangeProfileEvent(
                                        profileId: account.battleNetId,
                                        platformId: account.platformId));
                              });
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
                          screen: AddProfilePage(),
                          withNavBar: false,
                          // OPTIONAL VALUE. True by default.
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
            ));
      } else {
        return Container();
      }
    });
  }

  Widget _buildMainAccountTile(String mainAccount) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Card(
        color: Theme.of(context).buttonColor,
        child: ListTile(
          onTap: () {
            pushNewScreen(
              context,
              screen: SelectMainAccountPage(mainAccount: mainAccount),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            ).then((value) => setState(() {}));
          },
          title: Text(GlobalVariables.settingsMainAccountTitle,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "TitilliumWeb",
                fontWeight: FontWeight.w500,
              )),
          trailing: Text(
            mainAccount,
            style: TextStyle(color: Colors.white),
          ),
          enabled: true,
        ),
      ),
    );
  }

  Widget _buildVersionTile(String appVersion) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Card(
        color: Theme.of(context).buttonColor,
        child: ListTile(
          title: Text(
            GlobalVariables.settingsVersionTitle,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "TitilliumWeb",
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text(
            appVersion,
            style: TextStyle(color: Colors.white),
          ),
          enabled: true,
        ),
      ),
    );
  }

  Widget _buildLibrariesTile() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Card(
        color: Theme.of(context).buttonColor,
        child: ListTile(
          onTap: () {
            pushNewScreen(
              context,
              screen: OpenSourceLibrariesPage(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
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
        ),
      ),
    );
  }
}
