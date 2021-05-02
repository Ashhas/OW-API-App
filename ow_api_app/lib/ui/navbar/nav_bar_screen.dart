import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';

import 'package:ow_api_app/ui/home/home_page.dart';
import 'package:ow_api_app/ui/settings/settings_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _hideNavBar = false;
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColor: Theme.of(context).primaryColor,
        activeContentColor: Colors.white,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.menu),
        title: ("Settings"),
        activeColor: Theme.of(context).primaryColor,
        activeContentColor: Colors.white,
        inactiveColor: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<InitializationBloc, InitializationState>(
        builder: (context, state) {
          if (state is Initialized) {
            return Center(
              child: PersistentTabView(
                controller: state.navBarController,
                screens: [
                  HomePage(state.navBarController),
                  SettingsPage(navBarController: state.navBarController)
                ],
                items: _navBarsItems(),
                confineInSafeArea: true,
                backgroundColor: Theme.of(context).backgroundColor,
                handleAndroidBackButtonPress: true,
                resizeToAvoidBottomInset: true,
                stateManagement: true,
                hideNavigationBarWhenKeyboardShows: true,
                hideNavigationBar: _hideNavBar,
                popActionScreens: PopActionScreensType.once,
                navBarHeight: 55,
                onWillPop: () async {
                  await showDialog(
                    context: context,
                    useSafeArea: true,
                    builder: (context) => Container(
                      height: 50.0,
                      width: 50.0,
                      color: Colors.white,
                      child: RaisedButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                  return false;
                },
                popAllScreensOnTapOfSelectedTab: true,
                itemAnimationProperties: ItemAnimationProperties(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimation(
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle
                    .style10, // Choose the nav bar style with this property
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
