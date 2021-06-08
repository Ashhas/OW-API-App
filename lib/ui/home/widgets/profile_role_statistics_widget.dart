import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/util/constants/variable_const.dart';

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
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Role Statistics"),
                  ],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tank"),
                    Text(state.tankGamesPlayed.toString()),
                    Text(state.tankWinRate.toStringAsFixed(2) + "%"),
                  ],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Damage"),
                    Text(state.damageGamesPlayed.toString()),
                    Text(state.damageWinRate.toStringAsFixed(2) + "%"),
                  ],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Support"),
                    Text(state.supportGamesPlayed.toString()),
                    Text(state.supportWinRate.toStringAsFixed(2) + "%"),
                  ],
                ),
              ),
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
}
