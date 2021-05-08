import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';

import 'package:ow_api_app/data/util/strings.dart';

class RankRatingWidget extends StatelessWidget {
  const RankRatingWidget() : super();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is ProfileLoadedState) {
        return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    GlobalVariables.currentRankSeason,
                    style: Theme.of(context).primaryTextTheme.headline5,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: state.profileStats.ratings != null
                            ? state.profileStats.ratings.tank != null
                                ? _StatTile(
                                    ratingImageUrl: state
                                        .profileStats.ratings.tank.rankIcon,
                                    title: GlobalVariables.tankRoleTitle,
                                    rating: state
                                        .profileStats.ratings.tank.level
                                        .toString())
                                : _StatTile(
                                    ratingImageUrl: "--",
                                    title: GlobalVariables.tankRoleTitle,
                                    rating: GlobalVariables.noRankText)
                            : _StatTile(
                                ratingImageUrl: "--",
                                title: GlobalVariables.tankRoleTitle,
                                rating: GlobalVariables.noRankText)),
                    const _Divider(),
                    Expanded(
                        child: state.profileStats.ratings != null
                            ? state.profileStats.ratings.damage != null
                                ? _StatTile(
                                    ratingImageUrl: state
                                        .profileStats.ratings.damage.rankIcon,
                                    title: GlobalVariables.damageRoleTitle,
                                    rating: state
                                        .profileStats.ratings.damage.level
                                        .toString())
                                : _StatTile(
                                    ratingImageUrl: "--",
                                    title: GlobalVariables.damageRoleTitle,
                                    rating: GlobalVariables.noRankText)
                            : _StatTile(
                                ratingImageUrl: "--",
                                title: GlobalVariables.damageRoleTitle,
                                rating: GlobalVariables.noRankText)),
                    const _Divider(),
                    Expanded(
                        child: state.profileStats.ratings != null
                            ? state.profileStats.ratings.support != null
                                ? _StatTile(
                                    ratingImageUrl: state
                                        .profileStats.ratings.support.rankIcon,
                                    title: GlobalVariables.supportRoleTitle,
                                    rating: state
                                        .profileStats.ratings.support.level
                                        .toString())
                                : _StatTile(
                                    ratingImageUrl: "--",
                                    title: GlobalVariables.supportRoleTitle,
                                    rating: GlobalVariables.noRankText)
                            : _StatTile(
                                ratingImageUrl: "--",
                                title: GlobalVariables.supportRoleTitle,
                                rating: GlobalVariables.noRankText)),
                  ],
                ),
              ],
            ));
      } else {
        return Container();
      }
    });
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.grey, width: 1.0, height: 40.0);
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile(
      {Key key,
      @required this.rating,
      @required this.title,
      @required this.ratingImageUrl})
      : super(key: key);

  final String rating;
  final String title;
  final String ratingImageUrl;

  @override
  Widget build(BuildContext context) {
    return rating == "--"
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  Text(
                    rating,
                    style: Theme.of(context).primaryTextTheme.headline5,
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    title,
                    style: Theme.of(context).primaryTextTheme.headline5,
                  ),
                ],
              )
            ],
          )
        : Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(ratingImageUrl), fit: BoxFit.cover),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    rating,
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    title,
                    style: Theme.of(context).primaryTextTheme.headline5,
                  ),
                ],
              )
            ],
          );
  }
}
