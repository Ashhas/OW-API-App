import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/navigation/navigation_bar_bloc.dart';
import 'package:ow_api_app/ui/dashboard/dashboard_container.dart';
import 'package:ow_api_app/ui/settings/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
      builder: (context, navBarState) {
        return Scaffold(
          body: IndexedStack(
            index: navBarState.tabId,
            children: [
              DashboardContainer(),
              SettingsScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.space_dashboard_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_sharp), label: "More"),
            ],
            currentIndex: navBarState.tabId,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontSize: 12),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            backgroundColor: Theme.of(context).bottomAppBarColor,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).shadowColor,
            elevation: 6.0,
            onTap: (tabId) => BlocProvider.of<NavigationBarBloc>(context).add(
              NavigateToScreen(
                selectedIndex: tabId,
              ),
            ),
          ),
        );
      },
    );
  }
}
