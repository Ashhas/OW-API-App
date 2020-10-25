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
    return Card(
        color: Color.fromRGBO(255, 255, 255, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: _StatTile(
                    ratingImageUrl: profileStats
                        .eu.stats.competitive.overallStats.tankTierImage
                        .toString(),
                    title: "Tank",
                    rating: profileStats
                        .eu.stats.competitive.overallStats.tankComprank
                        .toString()),
              ),
              const _Divider(),
              Expanded(
                child: _StatTile(
                    ratingImageUrl: profileStats
                        .eu.stats.competitive.overallStats.damageTierImage
                        .toString(),
                    title: "Damage",
                    rating: profileStats
                        .eu.stats.competitive.overallStats.damageComprank
                        .toString()),
              ),
              const _Divider(),
              Expanded(
                child: _StatTile(
                    ratingImageUrl: profileStats
                        .eu.stats.competitive.overallStats.supportTierImage
                        .toString(),
                    title: "Support",
                    rating: profileStats
                        .eu.stats.competitive.overallStats.supportComprank
                        .toString()),
              ),
            ],
          ),
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
    return rating == "null"
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  Text(
                    "--",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    title,
                    style: TextStyle(color: Colors.black),
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
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    title,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              )
            ],
          );
  }
}
