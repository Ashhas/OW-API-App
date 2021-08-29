import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/navigation/navigation_bar_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/ui/settings/screens/about_screen.dart';
import 'package:ow_api_app/ui/settings/screens/add_profile_screen.dart';
import 'package:ow_api_app/ui/settings/screens/main_account_screen.dart';
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
        child: BlocListener<SettingsBloc, SettingsState>(
          listener: (context, settingsState) {
            if (settingsState is ProfileChangedState) {
              BlocProvider.of<NavigationBarBloc>(context).add(
                NavigateToScreen(selectedIndex: 0),
              );
            }
          },
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAvailableAccountsWidget(),
                    Divider(height: 1, thickness: 1),
                    _buildMainAccountTile(),
                    Divider(height: 1, thickness: 1),
                    _buildAboutTile(),
                    SizedBox(height: 100),
                  ],
                ),
              );
            },
          ),
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
        style: Theme.of(context).primaryTextTheme.headline6,
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
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                      dense: true,
                      tileColor: Theme.of(context).canvasColor,
                      trailing: IconButton(
                        icon: Icon(Icons.close,
                            color: Theme.of(context).cardColor),
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

  Widget _buildMainAccountTile() {
    return SettingsTile(
      title: UiConst.settingsMainAccountTitle,
      titleTextStyle: Theme.of(context).primaryTextTheme.subtitle2,
      leading: Icon(
        Icons.account_circle_outlined,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: (BuildContext context) {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftJoined,
            child: SelectMainAccountScreen(),
            childCurrent: this.widget,
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

  Widget _buildAboutTile() {
    return SettingsTile(
      title: "About",
      titleTextStyle: Theme.of(context).primaryTextTheme.subtitle2,
      leading: Icon(
        Icons.info_outline,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: (BuildContext context) {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftJoined,
            child: AboutScreen(),
            childCurrent: this.widget,
          ),
        );
      },
    );
  }
}
