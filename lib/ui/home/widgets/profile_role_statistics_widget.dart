import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';

class RoleStatisticsWidget extends StatefulWidget {
  const RoleStatisticsWidget() : super();

  @override
  _RoleStatisticsWidgetState createState() => _RoleStatisticsWidgetState();
}

class _RoleStatisticsWidgetState extends State<RoleStatisticsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is ProfileLoadedState) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              _titleView(),
              _statsTitle(),
              _tankStatsTile(state.tankGamesPlayed, state.tankWinRate),
              _damageStatsTile(state.damageGamesPlayed, state.damageWinRate),
              _supportStatsTile(state.supportGamesPlayed, state.supportWinRate),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget _titleView() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Role Statistics"),
        ],
      ),
    );
  }

  Widget _statsTitle() {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Roles"),
          Text("Games Played"),
          Text("Win Rate"),
        ],
      ),
    );
  }

  Widget _tankStatsTile(int gamesPlayed, double winRate) {
    return Container(
      height: 30,
      child: gamesPlayed != 0
          ? ListTile(
              leading: Text("Tank"),
              title: Center(child: Text(gamesPlayed.toString())),
              trailing: Text(winRate.toStringAsFixed(2) + "%"),
            )
          : ListTile(
              leading: Text("Tank"),
              title: Center(child: Text("--")),
              trailing: Text("--"),
            ),
    );
  }

  Widget _damageStatsTile(int gamesPlayed, double winRate) {
    return Container(
      height: 30,
      child: gamesPlayed != 0
          ? ListTile(
              leading: Text("Damage"),
              title: Center(child: Text(gamesPlayed.toString())),
              trailing: Text(winRate.toStringAsFixed(2) + "%"),
            )
          : ListTile(
              leading: Text("Damage"),
              title: Center(child: Text("--")),
              trailing: Text("--"),
            ),
    );
  }

  Widget _supportStatsTile(int gamesPlayed, double winRate) {
    return Container(
      height: 30,
      child: gamesPlayed != 0
          ? ListTile(
              leading: Text("Support"),
              title: Center(child: Text(gamesPlayed.toString())),
              trailing: Text(winRate.toStringAsFixed(2) + "%"),
            )
          : ListTile(
              leading: Text("Support"),
              title: Center(child: Text("--")),
              trailing: Text("--"),
            ),
    );
  }
}
