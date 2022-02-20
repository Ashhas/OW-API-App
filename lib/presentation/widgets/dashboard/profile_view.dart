import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/info_card.dart';
import 'package:ow_api_app/presentation/widgets/common/network_notification/network_notification.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/private_profile_widget.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/sections/rank_rating_widget.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/sections/role_statistics_widget.dart';

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
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
                          child: Container(
                            color: Theme.of(context).backgroundColor,
                            child: widget.currentProfile.private
                                ? const PrivateProfileWidget()
                                : Column(
                                    children: [
                                      RankRatingWidget(
                                        currentProfile: widget.currentProfile,
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
      ),
    );
  }
}
