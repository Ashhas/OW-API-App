import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ow_api_app/data/models/UserProfile.dart';

class RankRatingWidget extends StatelessWidget {
  final String rankRole;
  final String rankRoleIcon;
  final String rankRating;
  final String rankRatingIcon;

  const RankRatingWidget(
      {Key key,
      this.rankRole,
      this.rankRoleIcon,
      this.rankRating,
      this.rankRatingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 5),
          child: Container(
              alignment: Alignment.center,
              width: 20,
              height: 20,
              child: Image.network(
                rankRoleIcon,
                fit: BoxFit.fill,
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: NetworkImage(rankRatingIcon), fit: BoxFit.contain),
              ),
            ),
            Text(
              rankRating,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
