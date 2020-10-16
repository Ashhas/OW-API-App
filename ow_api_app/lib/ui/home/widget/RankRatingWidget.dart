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
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _StatTile(
                title: "Tank",
                rating: profileStats
                    .eu.stats.competitive.overallStats.tankComprank
                    .toString()),
          ),
          const _Divider(),
          Expanded(
            child: _StatTile(
                title: "Damage",
                rating: profileStats
                    .eu.stats.competitive.overallStats.damageComprank
                    .toString()),
          ),
          const _Divider(),
          Expanded(
            child: _StatTile(
                title: "Support",
                rating: profileStats
                    .eu.stats.competitive.overallStats.supportComprank
                    .toString()),
          ),
        ],
      ),
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
  const _StatTile({Key key, @required this.rating, @required this.title})
      : super(key: key);

  final String rating;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          rating,
          style: TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 2.0),
        Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
