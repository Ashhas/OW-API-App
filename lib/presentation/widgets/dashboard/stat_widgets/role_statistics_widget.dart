import 'package:flutter/material.dart';
import 'package:ow_api_app/data/model/profile_model.dart';

import '../title_view.dart';

class RoleStatisticsWidget extends StatefulWidget {
  final List<Map<String, TopHero?>>? topHeroes;
  final int? supportGamesPlayed;
  final int? supportGamesWon;
  final double? supportWinRate;
  final int? damageGamesPlayed;
  final int? damageGamesWon;
  final double? damageWinRate;
  final int? tankGamesPlayed;
  final int? tankGamesWon;
  final double? tankWinRate;

  const RoleStatisticsWidget({
    Key? key,
    this.topHeroes,
    this.supportGamesPlayed,
    this.supportGamesWon,
    this.supportWinRate,
    this.damageGamesPlayed,
    this.damageGamesWon,
    this.damageWinRate,
    this.tankGamesPlayed,
    this.tankGamesWon,
    this.tankWinRate,
  }) : super(key: key);

  @override
  _RoleStatisticsWidgetState createState() => _RoleStatisticsWidgetState();
}

class _RoleStatisticsWidgetState extends State<RoleStatisticsWidget> {
  @override
  Widget build(BuildContext context) {
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
                    displayText: widget.tankGamesPlayed,
                  ),
                  _percentageCell(
                    displayPercentage: widget.tankWinRate,
                  ),
                ],
              ),
              TableRow(
                children: [
                  _roleCell(
                    title: "Damage",
                  ),
                  _gamesPlayedCell(
                    displayText: widget.damageGamesPlayed,
                  ),
                  _percentageCell(
                    displayPercentage: widget.damageWinRate,
                  ),
                ],
              ),
              TableRow(
                children: [
                  _roleCell(
                    title: "Support",
                  ),
                  _gamesPlayedCell(
                    displayText: widget.supportGamesPlayed,
                  ),
                  _percentageCell(
                    displayPercentage: widget.supportWinRate,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
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
