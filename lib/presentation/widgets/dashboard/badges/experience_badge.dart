import 'package:flutter/material.dart';

class ExperienceBadge extends StatelessWidget {
  final int? profileLevel;
  final int? prestigeLevel;

  const ExperienceBadge({
    Key? key,
    required this.profileLevel,
    required this.prestigeLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int prestigeStarCount = prestigeLevel! % 6;

    return Container(
      height: 24,
      color: const Color.fromRGBO(199, 206, 219, 0.5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(3),
            child: Center(
              child: Text(
                profileLevel.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: prestigeStarCount,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.star,
                  color: Colors.yellowAccent,
                  size: 12,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
