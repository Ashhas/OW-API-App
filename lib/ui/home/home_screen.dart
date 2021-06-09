import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/ui/home/screens/error_ui_screen.dart';
import 'package:ow_api_app/ui/home/screens/home_loading_widget.dart';
import 'package:ow_api_app/ui/home/screens/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  final PersistentTabController navBarController;

  const HomeScreen(this.navBarController) : super();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeOpened());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is ProfileChangedState) {
            BlocProvider.of<HomeBloc>(context).add(LoadProfile(
                profileId: state.profileId, platformId: state.platformId));
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is LoadingProfileState) {
              return HomeLoadingScreen();
            } else if (state is ProfileLoadedState) {
              return ProfileScreen();
            } else if (state is HomeErrorState) {
              return ErrorUiScreen(state.exception);
            } else
              return HomeLoadingScreen();
          },
        ),
      ),
    );
  }
}
