import 'package:flutter/material.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/theme/spacing_const.dart';
import 'badges/account_visibility_badge.dart';
import 'badges/experience_badge.dart';

class InfoCard extends StatelessWidget {
  final Profile currentProfile;

  const InfoCard({
    Key? key,
    required this.currentProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Padding(
        padding: const EdgeInsets.only(
          left: SpacingConst.paddingXL,
          top: SpacingConst.paddingL,
          right: SpacingConst.paddingXL,
          bottom: SpacingConst.paddingL,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: 90,
                width: 90,
                child: Image(
                  image: NetworkImage(
                    currentProfile.icon.toString(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: SpacingConst.sizeUnitXL,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: SpacingConst.paddingM,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    currentProfile.name.toString(),
                    style: Theme.of(context).primaryTextTheme.headline5,
                  ),
                ),
                const SizedBox(
                  height: SpacingConst.paddingXS,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AccountVisibilityBadge(
                      isPrivateProfile: currentProfile.private,
                    ),
                    const SizedBox(
                      width: SpacingConst.paddingL,
                    ),
                    ExperienceBadge(
                      profileLevel: currentProfile.level,
                      prestigeLevel: currentProfile.prestige,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
