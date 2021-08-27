import 'package:flutter/material.dart';

class ExperienceBadge extends StatelessWidget {
  final int profileLevel;
  final int prestigeLevel;

  const ExperienceBadge({this.profileLevel, this.prestigeLevel}) : super();

  @override
  Widget build(BuildContext context) {
    int prestigeStarCount = prestigeLevel % 6;

    return Container(
      height: 24,
      width: 28 + (prestigeStarCount * 12).toDouble(),
      color: Color.fromRGBO(199, 206, 219, 0.5),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Text(
                profileLevel.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: prestigeStarCount,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                    size: 12,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
