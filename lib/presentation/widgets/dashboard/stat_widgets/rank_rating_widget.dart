import 'package:flutter/material.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/stat_widgets/rating_tile.dart';
import 'package:ow_api_app/theme/spacing_const.dart';
import 'package:ow_api_app/utils/constants.dart';

import '../title_view.dart';

class RankRatingWidget extends StatelessWidget {
  final Profile currentProfile;

  const RankRatingWidget({
    Key? key,
    required this.currentProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingConst.paddingXL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleView(title: Constants.competitiveRatingLabel),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingTile(
                title: Constants.tankRoleLabel,
                rating: currentProfile.ratings?.tank?.level.toString(),
                ratingImageUrl: currentProfile.ratings?.tank?.rankIcon,
              ),
              RatingTile(
                title: Constants.damageRoleLabel,
                rating: currentProfile.ratings?.damage?.level.toString(),
                ratingImageUrl: currentProfile.ratings?.damage?.rankIcon,
              ),
              RatingTile(
                title: Constants.damageRoleLabel,
                rating: currentProfile.ratings?.support?.level.toString(),
                ratingImageUrl: currentProfile.ratings?.support?.rankIcon,
              ),
            ],
          ),
          const SizedBox(height: SpacingConst.sizeUnitXL)
        ],
      ),
    );
  }
}
