import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/dashboard_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/ui/dashboard/screens/dashboard_error.dart';
import 'package:ow_api_app/ui/dashboard/screens/dashboard_loading.dart';
import 'package:ow_api_app/ui/dashboard/screens/dashboard_screen.dart';

class DashboardContainer extends StatefulWidget {
  const DashboardContainer() : super();

  @override
  _DashboardContainerState createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(OpenDashboard());
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
            BlocProvider.of<DashboardBloc>(context).add(LoadProfile(
                profileId: state.profileId, platformId: state.platformId));
          }
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is LoadingProfile) {
              return DashboardLoading();
            } else if (state is ProfileLoaded) {
              return DashboardScreen();
            } else if (state is ProfileError) {
              return DashboardError(state.exception);
            } else
              return DashboardLoading();
          },
        ),
      ),
    );
  }
}
