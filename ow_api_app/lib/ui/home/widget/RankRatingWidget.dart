import 'package:flutter/material.dart';
import 'package:ow_api_app/data/models/UserProfile.dart';

class RankRatingWidget extends StatelessWidget {
  final String rankRole;
  final String rankRoleIcon;
  final String rankRating;
  final String rankRatingIcon;

  const RankRatingWidget(
      {this.rankRole, this.rankRoleIcon, this.rankRating, this.rankRatingIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        color: Color.fromRGBO(48, 51, 66, 1),
        child: Center(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    rankRating,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: NetworkImage(rankRatingIcon),
                          fit: BoxFit.contain),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
