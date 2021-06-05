import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/ui/settings/screens/about_page.dart';
import 'package:ow_api_app/ui/settings/screens/help_and_faq_page.dart';
import 'package:ow_api_app/ui/settings/screens/main_account_page.dart';
import 'package:ow_api_app/ui/settings/screens/setting_page.dart';
import 'package:ow_api_app/ui/settings/widgets/settings_tile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:ow_api_app/util/strings.dart';
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
  bool networkAvailable = true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SettingsBloc>(context)
        .add(SettingsOpened(navBarController: widget.navBarController));
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
                    _buildAboutTile(),
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
      backgroundColor: Theme.of(context).accentColor,
      title: Text(
        GlobalVariables.settingsPageTitle,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  Widget _buildAvailableAccountsWidget() {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      if (state is SettingsLoadedState) {
        return Container(
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: state.allAccounts.listenable(),
                builder: (context, box, widget) {
                  if (box.values.isEmpty)
                    return ListTile(
                      title: Text(GlobalVariables.settingsNoAccountTitle),
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
                            style: TextStyle(color: Colors.white)),
                        dense: true,
                        tileColor: Theme.of(context).accentColor,
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
              Container(
                color: Theme.of(context).accentColor,
                child: TextButton(
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: AddProfilePage(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
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
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget _buildMainAccountTile(String mainAccount) {
    return SettingsTile(
      title: GlobalVariables.settingsMainAccountTitle,
      leading: Icon(Icons.account_circle_outlined),
      onPressed: (BuildContext context) {
        pushNewScreen(
          context,
          screen: SelectMainAccountPage(mainAccount: mainAccount),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        ).then((value) => setState(() {}));
      },
    );
  }

  Widget _buildSettingsTile() {
    return SettingsTile(
      title: "Settings",
      leading: Icon(Icons.settings),
      onPressed: (BuildContext context) {
        pushNewScreen(
          context,
          screen: SettingPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
    );
  }

  Widget _buildAboutTile() {
    return SettingsTile(
      title: "About",
      leading: Icon(Icons.info_outline),
      onPressed: (BuildContext context) {
        pushNewScreen(
          context,
          screen: AboutPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
    );
  }

  Widget _buildHelpAndFaqTile() {
    return SettingsTile(
      title: "Help/FAQ",
      leading: Icon(Icons.help_outline),
      onPressed: (BuildContext context) {
        pushNewScreen(
          context,
          screen: HelpFaqPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
    );
  }
}
