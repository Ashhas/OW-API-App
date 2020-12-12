import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ow_api_app/data/model/profile_model.dart';

class RankRatingWidget extends StatelessWidget {
  final Profile profileStats;

  const RankRatingWidget({
    Key key,
    this.profileStats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "- Competitive Season 23 -",
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: profileStats.ratings != null
                        ? profileStats.ratings.tank != null
                            ? _StatTile(
                                ratingImageUrl:
                                    profileStats.ratings.tank.rankIcon,
                                title: "Tank",
                                rating:
                                    profileStats.ratings.tank.level.toString())
                            : _StatTile(
                                ratingImageUrl: "--",
                                title: "Tank",
                                rating: "--")
                        : _StatTile(
                            ratingImageUrl: "--", title: "Tank", rating: "--")),
                const _Divider(),
                Expanded(
                    child: profileStats.ratings != null
                        ? profileStats.ratings.damage != null
                            ? _StatTile(
                                ratingImageUrl:
                                    profileStats.ratings.damage.rankIcon,
                                title: "Tank",
                                rating: profileStats.ratings.damage.level
                                    .toString())
                            : _StatTile(
                                ratingImageUrl: "--",
                                title: "Damage",
                                rating: "--")
                        : _StatTile(
                            ratingImageUrl: "--",
                            title: "Damage",
                            rating: "--")),
                const _Divider(),
                Expanded(
                    child: profileStats.ratings != null
                        ? profileStats.ratings.support != null
                            ? _StatTile(
                                ratingImageUrl:
                                    profileStats.ratings.support.rankIcon,
                                title: "Support",
                                rating: profileStats.ratings.support.level
                                    .toString())
                            : _StatTile(
                                ratingImageUrl: "--",
                                title: "Support",
                                rating: "--")
                        : _StatTile(
                            ratingImageUrl: "--",
                            title: "Support",
                            rating: "--")),
              ],
            ),
          ],
        ));
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
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    title,
                    style: TextStyle(color: Colors.white),
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
                    style: TextStyle(
                        fontFamily: "TitilliumWeb",
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          );
  }
}
