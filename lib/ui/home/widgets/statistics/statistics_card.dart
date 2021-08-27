import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/ui/home/widgets/statistics/private_profile_widget.dart';
import 'package:ow_api_app/ui/home/widgets/statistics/most_played_heroes_widget.dart';
import 'package:ow_api_app/ui/home/widgets/statistics/role_statistics_widget.dart';
import 'package:ow_api_app/ui/home/widgets/statistics/rank_rating_widget.dart';

class StatisticsCard extends StatefulWidget {
  const StatisticsCard({Key key}) : super(key: key);

  @override
  _StatisticsCardState createState() => _StatisticsCardState();
}

class _StatisticsCardState extends State<StatisticsCard> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is ProfileLoadedState) {
              return state.profileStats.private
                  ? PrivateProfileWidget()
                  : Column(
                      children: [
                        SizedBox(height: 2),
                        RankRatingWidget(),
                        Divider(height: 1, thickness: 1),
                        RoleStatisticsWidget(),
                        Divider(height: 1, thickness: 1),
                        MostPlayedHeroes(),
                      ],
                    );
            } else {
              return Container();
            }
          })),
    );
  }
}
