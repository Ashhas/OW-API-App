import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/stat_widgets/private_profile_widget.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/stat_widgets/rank_rating_widget.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/stat_widgets/role_statistics_widget.dart';

class StatisticsCard extends StatefulWidget {
  const StatisticsCard({Key? key}) : super(key: key);

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
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
            if (state is ProfileLoaded) {
              return state.profileStats.private
                  ? const PrivateProfileWidget()
                  : Column(
                      children: const [
                        SizedBox(height: 2),
                        RankRatingWidget(),
                        Divider(height: 1, thickness: 1),
                        RoleStatisticsWidget(),
                        Divider(height: 1, thickness: 1),
                      ],
                    );
            } else {
              return Container();
            }
          })),
    );
  }
}
