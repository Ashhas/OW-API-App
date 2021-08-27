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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleView(title: "Role Statistics"),
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

  Widget _statsTitle() {
    return Container(
      height: 40,
      child: ListTile(
        leading: Container(
          width: 80,
          child: Text("Roles",
              style: Theme.of(context).primaryTextTheme.bodyText1),
        ),
        title: Center(
          child: Container(
            width: 100,
            child: Text("Games Played",
                style: Theme.of(context).primaryTextTheme.bodyText1),
          ),
        ),
        trailing: Container(
          width: 60,
          child: Text("Win Rate",
              style: Theme.of(context).primaryTextTheme.bodyText1),
        ),
      ),
    );
  }

  Widget _tankStatsTile(int gamesPlayed, double winRate) {
    return Container(
      height: 30,
      child: gamesPlayed != 0
          ? ListTile(
              leading: Container(
                width: 80,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Image(
                        image: AssetImage('assets/roleIcons/icon-tank.png'),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("Tank",
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                  ],
                ),
              ),
              title: Center(
                child: Container(
                  width: 40,
                  child: Text(gamesPlayed.toString(),
                      style: Theme.of(context).primaryTextTheme.bodyText1),
                ),
              ),
              trailing: Container(
                width: 55,
                child: Text(winRate.toStringAsFixed(2) + "%",
                    style: Theme.of(context).primaryTextTheme.bodyText1),
              ),
            )
          : ListTile(
              leading: Container(
                width: 80,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Image(
                        image: AssetImage('assets/roleIcons/icon-tank.png'),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("Tank",
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                  ],
                ),
              ),
              title: Center(
                  child: Text("--",
                      style: Theme.of(context).primaryTextTheme.bodyText1)),
              trailing: Text("--",
                  style: Theme.of(context).primaryTextTheme.bodyText1),
            ),
    );
  }

  Widget _damageStatsTile(int gamesPlayed, double winRate) {
    return Container(
      height: 30,
      child: gamesPlayed != 0
          ? ListTile(
              leading: Container(
                width: 80,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Image(
                        image: AssetImage('assets/roleIcons/icon-offense.png'),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("Damage",
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                  ],
                ),
              ),
              title: Center(
                child: Container(
                  width: 40,
                  child: Text(
                    gamesPlayed.toString(),
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                ),
              ),
              trailing: Container(
                width: 55,
                child: Text(winRate.toStringAsFixed(2) + "%",
                    style: Theme.of(context).primaryTextTheme.bodyText1),
              ),
            )
          : ListTile(
              leading: Container(
                width: 80,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Image(
                        image: AssetImage('assets/roleIcons/icon-offense.png'),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("Damage",
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                  ],
                ),
              ),
              title: Center(
                  child: Text("--",
                      style: Theme.of(context).primaryTextTheme.bodyText1)),
              trailing: Text("--",
                  style: Theme.of(context).primaryTextTheme.bodyText1),
            ),
    );
  }

  Widget _supportStatsTile(int gamesPlayed, double winRate) {
    return Container(
      height: 30,
      child: gamesPlayed != 0
          ? ListTile(
              leading: Container(
                width: 80,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Image(
                        image: AssetImage('assets/roleIcons/icon-support.png'),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("Support",
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                  ],
                ),
              ),
              title: Center(
                child: Container(
                  width: 40,
                  child: Text(
                    gamesPlayed.toString(),
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                ),
              ),
              trailing: Container(
                width: 55,
                child: Text(winRate.toStringAsFixed(2) + "%",
                    style: Theme.of(context).primaryTextTheme.bodyText1),
              ),
            )
          : ListTile(
              leading: Container(
                width: 80,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Image(
                        image: AssetImage('assets/roleIcons/icon-support.png'),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("Support",
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                  ],
                ),
              ),
              title: Center(
                  child: Text("--",
                      style: Theme.of(context).primaryTextTheme.bodyText1)),
              trailing: Text("--",
                  style: Theme.of(context).primaryTextTheme.bodyText1),
            ),
    );
  }
}
