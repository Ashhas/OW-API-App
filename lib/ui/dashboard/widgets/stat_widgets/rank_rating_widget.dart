import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:ow_api_app/ui/dashboard/widgets/title_view.dart';
import 'package:ow_api_app/util/constants/ui_const.dart';

class RankRatingWidget extends StatelessWidget {
  const RankRatingWidget() : super();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleView(title: UiConst.competitiveRankTitle),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: state.profileStats.ratings != null
                            ? state.profileStats.ratings.tank != null
                                ? _StatTile(
                                    ratingImageUrl: state
                                        .profileStats.ratings.tank.rankIcon,
                                    title: UiConst.tankRoleTitle,
                                    rating: state
                                        .profileStats.ratings.tank.level
                                        .toString())
                                : _StatTile(
                                    ratingImageUrl: "--",
                                    title: UiConst.tankRoleTitle,
                                    rating: UiConst.noRankText)
                            : _StatTile(
                                ratingImageUrl: "--",
                                title: UiConst.tankRoleTitle,
                                rating: UiConst.noRankText)),
                    const _Divider(),
                    Expanded(
                        child: state.profileStats.ratings != null
                            ? state.profileStats.ratings.damage != null
                                ? _StatTile(
                                    ratingImageUrl: state
                                        .profileStats.ratings.damage.rankIcon,
                                    title: UiConst.damageRoleTitle,
                                    rating: state
                                        .profileStats.ratings.damage.level
                                        .toString())
                                : _StatTile(
                                    ratingImageUrl: "--",
                                    title: UiConst.damageRoleTitle,
                                    rating: UiConst.noRankText)
                            : _StatTile(
                                ratingImageUrl: "--",
                                title: UiConst.damageRoleTitle,
                                rating: UiConst.noRankText)),
                    const _Divider(),
                    Expanded(
                        child: state.profileStats.ratings != null
                            ? state.profileStats.ratings.support != null
                                ? _StatTile(
                                    ratingImageUrl: state
                                        .profileStats.ratings.support.rankIcon,
                                    title: UiConst.supportRoleTitle,
                                    rating: state
                                        .profileStats.ratings.support.level
                                        .toString())
                                : _StatTile(
                                    ratingImageUrl: "--",
                                    title: UiConst.supportRoleTitle,
                                    rating: UiConst.noRankText)
                            : _StatTile(
                                ratingImageUrl: "--",
                                title: UiConst.supportRoleTitle,
                                rating: UiConst.noRankText)),
                  ],
                ),
                SizedBox(height: 20)
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
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
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    title,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
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
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    title,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                ],
              )
            ],
          );
  }
}
