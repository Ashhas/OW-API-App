import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/ui/settings/screens/about_screen.dart';
import 'package:ow_api_app/ui/settings/screens/add_profile_screen.dart';
import 'package:ow_api_app/ui/settings/screens/help_and_faq_screen.dart';
import 'package:ow_api_app/ui/settings/screens/main_account_screen.dart';
import 'package:ow_api_app/ui/settings/screens/setting_screen.dart';
import 'package:ow_api_app/ui/settings/widgets/tiles/settings_tile.dart';
import 'package:ow_api_app/util/constants/ui_const.dart';
import 'package:page_transition/page_transition.dart';

import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen() : super();

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool networkAvailable = true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SettingsBloc>(context).add(SettingsOpened());
    BlocProvider.of<NetworkConnectionBloc>(context)
        .add(UpdateNetworkConnection());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocListener<NetworkConnectionBloc, NetworkConnectionState>(
        listener: (context, networkState) {
          if (networkState is NetworkConnectionUpdatedState) {
            setState(() {
              networkAvailable = true;
            });
          } else if (networkState is NoNetworkConnectionState) {
            setState(() {
              networkAvailable = false;
            });
          }
        },
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is SettingsLoadedState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAvailableAccountsWidget(),
                    Divider(height: 1, thickness: 1),
                    _buildMainAccountTile(state.mainAccount),
                    Divider(height: 1, thickness: 1),
                    _buildSettingsTile(),
                    _buildAboutTile(state.appVersion),
                    _buildHelpAndFaqTile(),
                    SizedBox(height: 100),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Theme.of(context).canvasColor,
      title: Text(
        UiConst.settingsPageTitle,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  Widget _buildAvailableAccountsWidget() {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      if (state is SettingsLoadedState) {
        return Column(
          children: [
            ValueListenableBuilder(
              valueListenable: state.allAccounts.listenable(),
              builder: (context, box, widget) {
                if (box.values.isEmpty)
                  return ListTile(
                    title: Text(UiConst.settingsNoAccountTitle),
                    enabled: true,
                  );

                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    AccountModel account = box.getAt(index);

                    return ListTile(
                      title: Text(
                        account.battleNetId,
                        style: TextStyle(color: Colors.white),
                      ),
                      dense: true,
                      tileColor: Theme.of(context).canvasColor,
                      trailing: IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        iconSize: 25,
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            state.allAccounts.deleteAt(index);
                          });
                        },
                      ),
                      onTap: () {
                        if (networkAvailable) {
                          BlocProvider.of<SettingsBloc>(context).add(
                              ChangeLoadedProfile(
                                  profileId: account.battleNetId,
                                  platformId: account.platformId));
                        }
                      },
                    );
                  },
                );
              },
            ),
            _buildAddAccountTile()
          ],
        );
      } else {
        return Container();
      }
    });
  }

  Widget _buildMainAccountTile(String mainAccount) {
    return SettingsTile(
      title: UiConst.settingsMainAccountTitle,
      titleTextStyle: Theme.of(context).primaryTextTheme.headline4,
      leading: Icon(
        Icons.account_circle_outlined,
        color: Theme.of(context).highlightColor,
      ),
      onPressed: (BuildContext context) {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftJoined,
            child: SelectMainAccountScreen(mainAccount: mainAccount),
            childCurrent: context.widget,
          ),
        ).then((value) => setState(() {}));
      },
    );
  }

  Widget _buildAddAccountTile() {
    return Container(
      color: Theme.of(context).canvasColor,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftJoined,
              child: AddProfileScreen(),
              childCurrent: this.widget,
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Colors.white),
            Text("Add Account", style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile() {
    return SettingsTile(
      title: "Settings",
      titleTextStyle: Theme.of(context).primaryTextTheme.headline4,
      leading: Icon(
        Icons.settings,
        color: Theme.of(context).highlightColor,
      ),
      onPressed: (BuildContext context) {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftJoined,
            child: SettingScreen(),
            childCurrent: this.widget,
          ),
        );
      },
    );
  }

  Widget _buildAboutTile(String appVersion) {
    return SettingsTile(
      title: "About",
      titleTextStyle: Theme.of(context).primaryTextTheme.headline4,
      leading: Icon(
        Icons.info_outline,
        color: Theme.of(context).highlightColor,
      ),
      onPressed: (BuildContext context) {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftJoined,
            child: AboutScreen(appVersion: appVersion),
            childCurrent: this.widget,
          ),
        );
      },
    );
  }

  Widget _buildHelpAndFaqTile() {
    return SettingsTile(
      title: "Help/FAQ",
      titleTextStyle: Theme.of(context).primaryTextTheme.headline4,
      leading: Icon(
        Icons.help_outline,
        color: Theme.of(context).highlightColor,
      ),
      onPressed: (BuildContext context) {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftJoined,
            child: HelpFaqScreen(),
            childCurrent: this.widget,
          ),
        );
      },
    );
  }
}
