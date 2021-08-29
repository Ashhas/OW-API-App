import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/ui/home/widgets/statistics/title_view_widget.dart';

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
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleView(title: "Role Statistics"),
              _gridViewStats(
                tankGamesPlayed: state.tankGamesPlayed,
                tankWinRate: state.tankWinRate,
                damageGamesPlayed: state.damageGamesPlayed,
                damageWinRate: state.damageWinRate,
                supportGamesPlayed: state.supportGamesPlayed,
                supportWinRate: state.supportWinRate,
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget _gridViewStats(
      {int tankGamesPlayed,
      int damageGamesPlayed,
      int supportGamesPlayed,
      double tankWinRate,
      double damageWinRate,
      double supportWinRate}) {
    return Container(
      height: 150,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: (1 / .3),
        physics: new NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          _gridNoCenterTitleTile(gridTitle: "Roles"),
          _gridTitleTile(gridTitle: "Games Played"),
          _gridTitleTile(gridTitle: "Win Rate"),
          _roleTile(
              title: "Tank", assetImage: "assets/roleIcons/icon-tank.png"),
          _gamesPlayedTile(displayText: tankGamesPlayed),
          _percentageTile(displayText: tankWinRate),
          _roleTile(
              title: "Damage", assetImage: "assets/roleIcons/icon-damage.png"),
          _gamesPlayedTile(displayText: damageGamesPlayed),
          _percentageTile(displayText: damageWinRate),
          _roleTile(
              title: "Support",
              assetImage: "assets/roleIcons/icon-support.png"),
          _gamesPlayedTile(displayText: supportGamesPlayed),
          _percentageTile(displayText: supportWinRate)
        ],
      ),
    );
  }

  Widget _gridTitleTile({String gridTitle}) {
    return Container(
      color: Colors.red,
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
      color: Colors.red,
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
              child: Text("--%",
                  style: Theme.of(context).primaryTextTheme.bodyText1),
            ),
          );
  }
}
