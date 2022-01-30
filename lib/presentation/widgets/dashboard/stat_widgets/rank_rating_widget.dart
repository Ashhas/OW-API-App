import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:ow_api_app/utils/strings.dart';

import '../title_view.dart';

class RankRatingWidget extends StatelessWidget {
  const RankRatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleView(title: 'Rank'),
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingTile(
                      title: 'Tank',
                      rating:
                          state.profileStats.ratings?.tank?.level.toString() ??
                              Strings.noRatingString,
                      ratingImageUrl:
                          state.profileStats.ratings?.tank?.rankIcon,
                    ),
                    RatingTile(
                      title: 'Damage',
                      rating: state.profileStats.ratings?.damage?.level
                              .toString() ??
                          Strings.noRatingString,
                      ratingImageUrl:
                          state.profileStats.ratings?.damage?.rankIcon,
                    ),
                    RatingTile(
                      title: 'Support',
                      rating: state.profileStats.ratings?.support?.level
                              .toString() ??
                          Strings.noRatingString,
                      ratingImageUrl:
                          state.profileStats.ratings?.support?.rankIcon,
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

class RatingTile extends StatelessWidget {
  final String? rating;
  final String? title;
  final String? ratingImageUrl;

  const RatingTile({
    Key? key,
    this.rating,
    this.title,
    this.ratingImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ratingImageUrl != null
                      ? NetworkImage(ratingImageUrl!)
                      : NetworkImage(Strings.nullIMage),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Column(
          children: [
            Text(
              rating != null ? rating.toString() : '--',
              style: Theme.of(context).primaryTextTheme.headline3,
            ),
            const SizedBox(height: 2.0),
            Text(
              title != null ? title.toString() : '--',
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
          ],
        )
      ],
    );
  }
}
