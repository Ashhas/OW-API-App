import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return SizedBox(
      height: 110,
      width: 130,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(3),
                topRight: Radius.circular(3)),
            side: BorderSide(width: 1, color: Colors.grey)),
        child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 6, left: 3),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(rankRatingIcon),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 3, bottom: 3),
                    child: Text(
                      "Support",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    rankRating,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Text(
                      "Diamond",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    "24W 20L",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
