import 'package:flutter/material.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/theme/spacing_const.dart';
import 'badges/account_visibility_badge.dart';
import 'badges/experience_badge.dart';

class InfoCard extends StatefulWidget {
  final Profile currentProfile;

  const InfoCard({
    Key? key,
    required this.currentProfile,
  }) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.only(
          top: SpacingConst.paddingXL,
          left: SpacingConst.paddingXL,
          right: SpacingConst.paddingXL,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: 95,
                width: 95,
                child: Image(
                  image: NetworkImage(
                    widget.currentProfile.icon.toString(),
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
                  height: SpacingConst.paddingXS,
                ),
                Text(
                  widget.currentProfile.name.toString(),
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
                const SizedBox(
                  height: SpacingConst.paddingXS,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AccountVisibilityBadge(
                      isPrivateProfile: widget.currentProfile.private,
                    ),
                    const SizedBox(
                      width: SpacingConst.paddingL,
                    ),
                    ExperienceBadge(
                      profileLevel: widget.currentProfile.level,
                      prestigeLevel: widget.currentProfile.prestige,
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
