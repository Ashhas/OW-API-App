import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/ui/home/profile_display_widget.dart';
import 'package:ow_api_app/ui/home/widget/error_ui_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  final PersistentTabController navBarController;

  const HomePage(this.navBarController) : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              return buildLoadingWidget();
            } else if (state is ProfileLoadedState) {
              return ProfileDisplayWidget();
            } else if (state is HomeErrorState) {
              return ErrorUiWidget(state.exception);
            } else
              return buildLoadingWidget();
          },
        ),
      ),
    );
  }

  Widget buildLoadingWidget() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          valueColor:
              new AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
