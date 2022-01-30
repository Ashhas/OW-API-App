import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';

import '../title_view.dart';

class RoleStatisticsWidget extends StatefulWidget {
  const RoleStatisticsWidget({Key? key}) : super(key: key);

  @override
  _RoleStatisticsWidgetState createState() => _RoleStatisticsWidgetState();
}

class _RoleStatisticsWidgetState extends State<RoleStatisticsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      if (state is ProfileLoaded) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleView(title: "Role Statistics"),
              Table(
                border: TableBorder.all(),
                columnWidths: const {
                  0: FractionColumnWidth(0.3),
                  1: FractionColumnWidth(0.4),
                  2: FractionColumnWidth(0.3),
                },
                children: [
                  TableRow(
                    children: [
                      _customTitleCell(
                        title: "Roles",
                      ),
                      _customTitleCell(
                        title: "Games Played",
                      ),
                      _customTitleCell(
                        title: "Winrate",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      _roleCell(
                        title: "Tank",
                      ),
                      _gamesPlayedCell(
                        displayText: state.tankGamesPlayed,
                      ),
                      _percentageCell(
                        displayPercentage: state.tankWinRate,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      _roleCell(
                        title: "Damage",
                      ),
                      _gamesPlayedCell(
                        displayText: state.damageGamesPlayed,
                      ),
                      _percentageCell(
                        displayPercentage: state.damageWinRate,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      _roleCell(
                        title: "Support",
                      ),
                      _gamesPlayedCell(
                        displayText: state.supportGamesPlayed,
                      ),
                      _percentageCell(
                        displayPercentage: state.supportWinRate,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget _customTitleCell({String? title}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          title!,
          style: Theme.of(context).primaryTextTheme.bodyText2,
        ),
      ),
    );
  }

  Widget _roleCell({String? title}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          title!,
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
      ),
    );
  }

  Widget _gamesPlayedCell({int? displayText}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
            displayText! > 0 || displayText.isNaN
                ? displayText.toString()
                : '--',
            style: Theme.of(context).primaryTextTheme.bodyText1),
      ),
    );
  }

  Widget _percentageCell({double? displayPercentage}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
            !displayPercentage!.isNaN
                ? '${displayPercentage.toStringAsFixed(2)} %'
                : '--',
            style: Theme.of(context).primaryTextTheme.bodyText1),
      ),
    );
  }
}
