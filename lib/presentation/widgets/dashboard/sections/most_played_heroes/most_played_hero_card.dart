import 'package:flutter/material.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/hero_image.dart';
import 'package:ow_api_app/utils/constants.dart';

class MostPlayedHeroCard extends StatelessWidget {
  final String? heroName;
  final DateTime? timePlayed;

  const MostPlayedHeroCard({
    Key? key,
    required this.heroName,
    required this.timePlayed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? competitiveHoursPlayed = timePlayed
        ?.difference(DateTime.parse(Constants.standardConversionDateTime))
        .inHours;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 115,
            height: 100,
            color: Colors.blue,
            child: HeroImage(
              heroName: heroName ?? '',
            ),
          ),
          Text(heroName ?? ''),
          competitiveHoursPlayed == 0
              ? Text(
                  '${timePlayed?.difference(DateTime.parse(Constants.standardConversionDateTime)).inMinutes.toString()} Minutes')
              : Text(
                  '${timePlayed?.difference(DateTime.parse(Constants.standardConversionDateTime)).inHours.toString()} Hours',
                )
        ],
      ),
    );
  }
}
