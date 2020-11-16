import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ow_api_app/bloc/bottomNavigation/nav_bar_bloc.dart';
import 'package:ow_api_app/bloc/bottomNavigation/nav_bar_event.dart';
import 'package:ow_api_app/bloc/bottomNavigation/nav_bar_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/ui/home/home_page.dart';

class NavBarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavBarScreenState();
}

class NavBarScreenState extends State<NavBarScreen> {
  @override
  Widget build(BuildContext context) {
    final NavBarBloc navBarBloc = BlocProvider.of<NavBarBloc>(context);

    return Scaffold(
        backgroundColor: Color(0xFF285993),
        body: BlocBuilder<NavBarBloc, NavBarState>(
          builder: (BuildContext context, NavBarState state) {
            if (state is PageLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FirstPageLoaded) {
              return HomePage();
            }
            if (state is SecondPageLoaded) {
              return Container();
            }
            return Container();
          },
        ),
        bottomNavigationBar: BlocBuilder<NavBarBloc, NavBarState>(
          builder: (BuildContext context, NavBarState state) {
            return BottomNavyBar(
              backgroundColor: Color(0xFF285993),
              selectedIndex: navBarBloc.currentIndex,
              onItemSelected: (index) =>
                  navBarBloc.add(MenuTapped(index: index)),
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Page 1'),
                  textAlign: TextAlign.center,
                  activeColor: Color(0xFFFFA816),
                  inactiveColor: Color(0xFFFFFFFF),
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.supervised_user_circle),
                  title: Text('Page 2'),
                  textAlign: TextAlign.center,
                  activeColor: Color(0xFFFFA816),
                  inactiveColor: Color(0xFFFFFFFF),
                ),
              ],
            );
          },
        ));
  }
}
