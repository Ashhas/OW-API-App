import 'package:flutter/material.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/circular_card.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/info_card.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/network_notification.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/stat_widgets/private_profile_widget.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/stat_widgets/rank_rating_widget.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/stat_widgets/role_statistics_widget.dart';
import 'package:ow_api_app/theme/spacing_const.dart';

class ProfileView extends StatefulWidget {
  final Profile currentProfile;
  final List<Map<String, TopHero?>>? topHeroes;
  final int? supportGamesPlayed;
  final int? supportGamesWon;
  final double? supportWinRate;
  final int? damageGamesPlayed;
  final int? damageGamesWon;
  final double? damageWinRate;
  final int? tankGamesPlayed;
  final int? tankGamesWon;
  final double? tankWinRate;

  const ProfileView({
    Key? key,
    required this.currentProfile,
    this.topHeroes,
    this.supportGamesPlayed,
    this.supportGamesWon,
    this.supportWinRate,
    this.damageGamesPlayed,
    this.damageGamesWon,
    this.damageWinRate,
    this.tankGamesPlayed,
    this.tankGamesWon,
    this.tankWinRate,
  }) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const NetworkNotification(),
                      InfoCard(
                        currentProfile: widget.currentProfile,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: CircularCard(
                          widgetColumn: widget.currentProfile.private
                              ? const PrivateProfileWidget()
                              : Column(
                                  children: [
                                    const SizedBox(
                                        height: SpacingConst.sizeUnitXXS),
                                    RankRatingWidget(
                                      currentProfile: widget.currentProfile,
                                    ),
                                    const Divider(
                                      height: SpacingConst.dividerHeight,
                                      thickness: SpacingConst.dividerThickness,
                                    ),
                                    RoleStatisticsWidget(
                                      tankWinRate: widget.tankWinRate,
                                      tankGamesWon: widget.tankGamesWon,
                                      tankGamesPlayed: widget.tankGamesPlayed,
                                      damageWinRate: widget.damageWinRate,
                                      damageGamesWon: widget.damageGamesWon,
                                      damageGamesPlayed:
                                          widget.damageGamesPlayed,
                                      supportWinRate: widget.supportWinRate,
                                      supportGamesWon: widget.supportGamesWon,
                                      supportGamesPlayed:
                                          widget.supportGamesPlayed,
                                    ),
                                    const Divider(
                                      height: SpacingConst.dividerHeight,
                                      thickness: SpacingConst.dividerThickness,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
