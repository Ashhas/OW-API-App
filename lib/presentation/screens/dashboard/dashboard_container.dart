import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';

import 'dashboard_error.dart';
import 'dashboard_loading.dart';
import 'dashboard_screen.dart';

class DashboardContainer extends StatefulWidget {
  const DashboardContainer({Key? key}) : super(key: key);

  @override
  _DashboardContainerState createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is LoadingProfile) {
          return const DashboardLoading();
        } else if (state is ProfileLoaded) {
          return const DashboardScreen();
        } else if (state is ProfileError) {
          return DashboardError(exception: state.exception);
        } else {
          return Container(
            color: Colors.red,
          );
        }
      },
    );
  }
}
