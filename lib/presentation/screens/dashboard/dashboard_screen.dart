import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/profile_view.dart';

import 'dashboard_error.dart';
import 'dashboard_loading.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is LoadingProfile) {
          return const DashboardLoading();
        } else if (state is ProfileLoaded) {
          return ProfileView(
            currentProfile: state.profileStats,
            tankWinRate: state.tankWinRate,
            tankGamesWon: state.tankGamesWon,
            tankGamesPlayed: state.tankGamesPlayed,
            damageWinRate: state.damageWinRate,
            damageGamesWon: state.damageGamesWon,
            damageGamesPlayed: state.damageGamesPlayed,
            supportWinRate: state.supportWinRate,
            supportGamesWon: state.supportGamesWon,
            supportGamesPlayed: state.supportGamesPlayed,
          );
        } else if (state is ProfileError) {
          return DashboardError(exception: state.exception);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
