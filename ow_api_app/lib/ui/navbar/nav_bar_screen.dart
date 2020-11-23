import 'package:flutter/material.dart';
import 'package:ow_api_app/ui/home/home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavBarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavBarScreenState();
}

class NavBarScreenState extends State<NavBarScreen> {
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 1);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      Container(
        color: Color.fromRGBO(48, 68, 78, 1.0),
        child: Center(
          child: Text("Updates", style: TextStyle(color: Colors.white)),
        ),
      ),
      HomePage(),
      Container(
        color: Color.fromRGBO(48, 68, 78, 1.0),
        child: Center(
          child: Text("Settings", style: TextStyle(color: Colors.white)),
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.rss_feed),
        title: ("Updates"),
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "Home",
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PersistentTabView(
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Color.fromRGBO(48, 68, 78, 1.0),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        hideNavigationBar: _hideNavBar,
        popActionScreens: PopActionScreensType.once,
        bottomScreenMargin: 0.0,
        navBarHeight: 65,
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
        decoration:
            NavBarDecoration(colorBehindNavBar: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
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
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property
      ),
    );
  }
}
