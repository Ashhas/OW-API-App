import 'package:flutter/material.dart';
import 'package:ow_api_app/theme/spacing_const.dart';
import 'package:ow_api_app/utils/constants.dart';

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
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            image: ratingImageUrl != null
                ? DecorationImage(
                    image: NetworkImage(ratingImageUrl!),
                    fit: BoxFit.cover,
                  )
                : const DecorationImage(
                    image: AssetImage('assets/rankIcons/no-rank.png'),
                  ),
          ),
        ),
        Text(
          rating != null ? rating.toString() : Constants.unRankedLabel,
          style: Theme.of(context).primaryTextTheme.headline3,
        ),
        const SizedBox(height: SpacingConst.sizeUnitXXS),
        Text(
          title != null ? title.toString() : Constants.noRatingString,
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
      ],
    );
  }
}
