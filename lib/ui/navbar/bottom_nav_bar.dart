import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/ui/home/home_screen.dart';
import 'package:ow_api_app/ui/settings/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget _navBarPages(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return SettingsScreen();
        break;
      default:
        return HomeScreen();
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InitializationBloc, InitializationState>(
        builder: (context, state) {
          if (state is InitializedState) {
            return Center(
              child: _navBarPages(_selectedIndex),
            );
          } else {
            return Container();
          }
        },
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
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        backgroundColor: Theme.of(context).bottomAppBarColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).shadowColor,
        elevation: 6.0,
        onTap: _onItemTapped,
      ),
    );
  }
}
