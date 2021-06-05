import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/util/strings.dart';

class MostPlayedHeroes extends StatefulWidget {
  const MostPlayedHeroes() : super();

  @override
  _MostPlayedHeroesState createState() => _MostPlayedHeroesState();
}

class _MostPlayedHeroesState extends State<MostPlayedHeroes> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is ProfileLoadedState) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Most Played Heroes"),
                    Icon(Icons.arrow_forward_ios_sharp),
                  ],
                ),
              ),
              Container(
                height: 135.0,
                child: new ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.topHeroes.length,
                  itemBuilder: (context, index) {
                    return _mostPlayedHeroCard(
                        state.topHeroes[index].entries.single.key,
                        state.topHeroes[index].entries.single.value.timePlayed);
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  _mostPlayedHeroCard(String heroName, DateTime timePlayed) {
    int competitiveHoursPlayed = timePlayed
        .difference(DateTime.parse(GlobalVariables.standardConversionDateTime))
        .inHours;

    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 90,
            color: Colors.blue,
            child: _heroImage(heroName),
          ),
          Text(heroName),
          competitiveHoursPlayed == 0
              ? Text(timePlayed
                      .difference(DateTime.parse(
                          GlobalVariables.standardConversionDateTime))
                      .inMinutes
                      .toString() +
                  " Minutes")
              : Text(timePlayed
                      .difference(DateTime.parse(
                          GlobalVariables.standardConversionDateTime))
                      .inHours
                      .toString() +
                  " Hours")
        ],
      ),
    );
  }

  _heroImage(String heroName) {
    if (heroName == "Orisa") {
      return Container(
          width: 110,
          height: 90,
          child: Center(
              child: Image(image: AssetImage('assets/heroIcons/orisa.png'))));
    } else if (heroName == "Reinhardt") {
      return Container(
          width: 110,
          height: 90,
          child: Center(
              child: Image(image: AssetImage('assets/heroIcons/rein.png'))));
    } else if (heroName == "Roadhog") {
      return Container(
          width: 110,
          height: 90,
          child: Center(
              child: Image(image: AssetImage('assets/heroIcons/roadhog.png'))));
    } else if (heroName == "Sigma") {
      return Container(
          width: 110,
          height: 90,
          child: Center(
              child: Image(image: AssetImage('assets/heroIcons/sigma.png'))));
    } else if (heroName == "Winston") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/winston.png'),
          ),
        ),
      );
    } else if (heroName == "WreckingBall") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/wrecking-ball.png'),
          ),
        ),
      );
    } else if (heroName == "Zarya") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/zarya.png'),
          ),
        ),
      );
    } else if (heroName == "Ashe") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/ashe.png'),
          ),
        ),
      );
    } else if (heroName == "Bastion") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/bastion.png'),
          ),
        ),
      );
    } else if (heroName == "Doomfist") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/doomfist.png'),
          ),
        ),
      );
    } else if (heroName == "Echo") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/echo.png'),
          ),
        ),
      );
    } else if (heroName == "Genji") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/genji.png'),
          ),
        ),
      );
    } else if (heroName == "Hanzo") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/hanzo.png'),
          ),
        ),
      );
    } else if (heroName == "Junkrat") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/junkrat.png'),
          ),
        ),
      );
    } else if (heroName == "McCree") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/mccree.png'),
          ),
        ),
      );
    } else if (heroName == "Mei") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/mei.png'),
          ),
        ),
      );
    } else if (heroName == "Pharah") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/pharah.png'),
          ),
        ),
      );
    } else if (heroName == "Reaper") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/reaper.png'),
          ),
        ),
      );
    } else if (heroName == "Soldier76") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/soldier-76.png'),
          ),
        ),
      );
    } else if (heroName == "Sombra") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/sombra.png'),
          ),
        ),
      );
    } else if (heroName == "Symmetra") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/symmetra.png'),
          ),
        ),
      );
    } else if (heroName == "Torbjörn") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/torbjorn.png'),
          ),
        ),
      );
    } else if (heroName == "Tracer") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/tracer.png'),
          ),
        ),
      );
    } else if (heroName == "Widowmaker") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/widowmaker.png'),
          ),
        ),
      );
    } else if (heroName == "Ana") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/ana.png'),
          ),
        ),
      );
    } else if (heroName == "Baptiste") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/baptiste.png'),
          ),
        ),
      );
    } else if (heroName == "Brigitte") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/brigitte.png'),
          ),
        ),
      );
    } else if (heroName == "Lúcio") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/lucio.png'),
          ),
        ),
      );
    } else if (heroName == "Mercy") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/mercy.png'),
          ),
        ),
      );
    } else if (heroName == "Moira") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/moira.png'),
          ),
        ),
      );
    } else if (heroName == "Zenyatta") {
      return Container(
        width: 110,
        height: 90,
        child: Center(
          child: Image(
            image: AssetImage('assets/heroIcons/zenyatta.png'),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
