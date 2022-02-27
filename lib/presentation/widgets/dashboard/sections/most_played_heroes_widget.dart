import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';

import '../../../../data/model/profile_model.dart';
import '../../../../utils/constants.dart';
import '../../common/title_view/title_view.dart';

class MostPlayedHeroesWidget extends StatelessWidget {
  final List<Map<String, TopHero?>>? topHeroes;

  const MostPlayedHeroesWidget({
    Key? key,
    required this.topHeroes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleView(title: "Most Played Heroes"),
              SizedBox(
                height: 150.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: topHeroes?.length,
                  itemBuilder: (context, index) {
                    return _mostPlayedHeroCard(
                        topHeroes![index].entries.single.key,
                        topHeroes![index].entries.single.value?.timePlayed);
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      },
    );
  }

  _mostPlayedHeroCard(String? heroName, DateTime? timePlayed) {
    int? competitiveHoursPlayed = timePlayed
        ?.difference(DateTime.parse(Constants.standardConversionDateTime))
        .inHours;

    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Container(
            width: 120,
            height: 100,
            color: Colors.blue,
            child: _heroImage(heroName ?? ''),
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

  _heroImage(String heroName) {
    if (heroName == "Diva") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/dva.png'),
          ),
        ),
      );
    } else if (heroName == "Orisa") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/orisa.png'),
          ),
        ),
      );
    } else if (heroName == "Reinhardt") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/rein.png'),
          ),
        ),
      );
    } else if (heroName == "Roadhog") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/roadhog.png'),
          ),
        ),
      );
    } else if (heroName == "Sigma") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/sigma.png'),
          ),
        ),
      );
    } else if (heroName == "Winston") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/winston.png'),
          ),
        ),
      );
    } else if (heroName == "WreckingBall") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/wrecking-ball.png'),
          ),
        ),
      );
    } else if (heroName == "Zarya") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/zarya.png'),
          ),
        ),
      );
    } else if (heroName == "Ashe") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/ashe.png'),
          ),
        ),
      );
    } else if (heroName == "Bastion") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/bastion.png'),
          ),
        ),
      );
    } else if (heroName == "Doomfist") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/doomfist.png'),
          ),
        ),
      );
    } else if (heroName == "Echo") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/echo.png'),
          ),
        ),
      );
    } else if (heroName == "Genji") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/genji.png'),
          ),
        ),
      );
    } else if (heroName == "Hanzo") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/hanzo.png'),
          ),
        ),
      );
    } else if (heroName == "Junkrat") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/junkrat.png'),
          ),
        ),
      );
    } else if (heroName == "McCree") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/mccree.png'),
          ),
        ),
      );
    } else if (heroName == "Mei") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/mei.png'),
          ),
        ),
      );
    } else if (heroName == "Pharah") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/pharah.png'),
          ),
        ),
      );
    } else if (heroName == "Reaper") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/reaper.png'),
          ),
        ),
      );
    } else if (heroName == "Soldier76") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/soldier-76.png'),
          ),
        ),
      );
    } else if (heroName == "Sombra") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/sombra.png'),
          ),
        ),
      );
    } else if (heroName == "Symmetra") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/symmetra.png'),
          ),
        ),
      );
    } else if (heroName == "Torbjörn") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/torbjorn.png'),
          ),
        ),
      );
    } else if (heroName == "Tracer") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/tracer.png'),
          ),
        ),
      );
    } else if (heroName == "Widowmaker") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/widowmaker.png'),
          ),
        ),
      );
    } else if (heroName == "Ana") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/ana.png'),
          ),
        ),
      );
    } else if (heroName == "Baptiste") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/baptiste.png'),
          ),
        ),
      );
    } else if (heroName == "Brigitte") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/brigitte.png'),
          ),
        ),
      );
    } else if (heroName == "Lucio") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/lucio.png'),
          ),
        ),
      );
    } else if (heroName == "Mercy") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/mercy.png'),
          ),
        ),
      );
    } else if (heroName == "Moira") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/moira.png'),
          ),
        ),
      );
    } else if (heroName == "Zenyatta") {
      return const SizedBox(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/zenyatta.png'),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
