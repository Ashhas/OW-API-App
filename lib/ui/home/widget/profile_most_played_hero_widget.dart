import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/data/util/strings.dart';

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
            width: 110,
            height: 90,
            color: Colors.blue,
            child: Center(child: Text(heroName)),
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
}
