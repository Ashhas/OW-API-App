import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/presentation/widgets/common/title_view/title_view.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/sections/most_played_heroes/most_played_hero_card.dart';
import 'package:ow_api_app/theme/spacing_const.dart';

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
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingConst.paddingM,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleView(title: "Most Played Heroes"),
              SizedBox(
                height: 140.0,
                child: topHeroes != null
                    ? ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: SpacingConst.sizeUnitXS);
                        },
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        clipBehavior: Clip.none,
                        itemCount: topHeroes!.length,
                        itemBuilder: (context, index) {
                          if (topHeroes?[index] != null) {
                            return MostPlayedHeroCard(
                              heroName: topHeroes![index].entries.single.key,
                              timePlayed: topHeroes![index]
                                  .entries
                                  .single
                                  .value
                                  ?.timePlayed,
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                        scrollDirection: Axis.horizontal,
                      )
                    : Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: const Text('No data found!'),
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
}
