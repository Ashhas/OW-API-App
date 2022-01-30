import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/bottom_navigation/bottom_navigation_cubit.dart.dart';
import 'package:ow_api_app/presentation/screens/dashboard/dashboard_container.dart';
import 'package:ow_api_app/presentation/screens/more/more_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.read<BottomNavigationCubit>().state,
        children: const [
          DashboardContainer(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_sharp),
            label: "More",
          ),
        ],
        currentIndex: context.select(
          (BottomNavigationCubit bottomNavigation) => bottomNavigation.state,
        ),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        backgroundColor: Theme.of(context).bottomAppBarColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).shadowColor,
        elevation: 6.0,
        onTap: (tabId) => BlocProvider.of<BottomNavigationCubit>(context)
            .updateSelectedIndex(tabId),
      ),
    );
  }
}
