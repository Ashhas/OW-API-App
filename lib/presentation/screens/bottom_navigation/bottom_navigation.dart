import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/bottom_navigation/bottom_navigation_cubit.dart.dart';
import 'package:ow_api_app/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:ow_api_app/presentation/screens/more/more_screen.dart';
import 'package:ow_api_app/utils/constants.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.read<BottomNavigationCubit>().state,
        children: const [
          DashboardScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard_outlined),
            label: Constants.homeLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: Constants.moreLabel,
          ),
        ],
        currentIndex: context.select(
          (BottomNavigationCubit bottomNavigation) => bottomNavigation.state,
        ),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
