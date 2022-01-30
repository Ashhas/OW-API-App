import 'package:flutter/material.dart';

class ExperienceBadge extends StatelessWidget {
  final int profileLevel;
  final int prestigeLevel;

  const ExperienceBadge({
    Key? key,
    required this.profileLevel,
    required this.prestigeLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int prestigeStarCount = prestigeLevel % 6;

    return Container(
      height: 24,
      width: 28 + (prestigeStarCount * 12).toDouble(),
      color: const Color.fromRGBO(199, 206, 219, 0.5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: prestigeStarCount,
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.yellowAccent,
                  size: 12,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
