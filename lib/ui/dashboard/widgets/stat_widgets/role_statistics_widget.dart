import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:ow_api_app/ui/dashboard/widgets/title_view.dart';

class RoleStatisticsWidget extends StatefulWidget {
  const RoleStatisticsWidget() : super();

  @override
  _RoleStatisticsWidgetState createState() => _RoleStatisticsWidgetState();
}

class _RoleStatisticsWidgetState extends State<RoleStatisticsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
      if (state is ProfileLoaded) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleView(title: "Role Statistics"),
              Table(
                children: [
                  TableRow(
                    children: [
                      _gridTitleTile(
                        gridTitle: "Roles",
                      ),
                      _gridTitleTile(
                        gridTitle: "Games Played",
                      ),
                      _gridTitleTile(
                        gridTitle: "Winrate",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      _roleTile(
                        title: "Tank",
                        assetImage: "assets/roleIcons/icon-tank.png",
                      ),
                      _gamesPlayedTile(
                        displayText: state.tankGamesPlayed,
                      ),
                      _percentageTile(
                        displayText: state.tankWinRate,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      _roleTile(
                        title: "Damage",
                        assetImage: "assets/roleIcons/icon-damage.png",
                      ),
                      _gamesPlayedTile(
                        displayText: state.damageGamesPlayed,
                      ),
                      _percentageTile(
                        displayText: state.damageWinRate,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      _roleTile(
                        title: "Tank",
                        assetImage: "assets/roleIcons/icon-support.png",
                      ),
                      _gamesPlayedTile(
                        displayText: state.supportGamesPlayed,
                      ),
                      _percentageTile(
                        displayText: state.supportWinRate,
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

  Widget _gridTitleTile({String gridTitle}) {
    return Container(
      child: Center(
        child: Text(
          gridTitle,
          style: Theme.of(context).primaryTextTheme.bodyText2,
        ),
      ),
    );
  }

  Widget _gridNoCenterTitleTile({String gridTitle}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              gridTitle,
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _roleTile({String title, String assetImage}) {
    return Center(
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 15,
              height: 15,
              child: Image(
                image: AssetImage(assetImage),
              ),
            ),
            SizedBox(width: 5),
            Text(title, style: Theme.of(context).primaryTextTheme.bodyText1),
          ],
        ),
      ),
    );
  }

  Widget _gamesPlayedTile({int displayText}) {
    return displayText > 0 || !displayText.isNaN
        ? Center(
            child: Container(
              child: Text(displayText.toString(),
                  style: Theme.of(context).primaryTextTheme.bodyText1),
            ),
          )
        : Center(
            child: Container(
              child: Text("--",
                  style: Theme.of(context).primaryTextTheme.bodyText1),
            ),
          );
  }

  Widget _percentageTile({double displayText}) {
    return !displayText.isNaN
        ? Center(
            child: Container(
              child: Text(displayText.toStringAsFixed(2) + "%",
                  style: Theme.of(context).primaryTextTheme.bodyText1),
            ),
          )
        : Center(
            child: Container(
              child: Text("--",
                  style: Theme.of(context).primaryTextTheme.bodyText1),
            ),
          );
  }
}
