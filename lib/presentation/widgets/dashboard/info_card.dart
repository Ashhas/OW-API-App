import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'badges/account_visibility_badge.dart';
import 'badges/experience_badge.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      if (state is ProfileLoaded) {
        return Container(
          height: 140,
          width: double.infinity,
          color: Theme.of(context).canvasColor,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: 95,
                    width: 95,
                    color: Colors.teal,
                    child: Image(
                      image: NetworkImage(
                        state.profileStats.icon.toString(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          state.profileStats.name.toString(),
                          style: Theme.of(context).primaryTextTheme.headline5,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        AccountVisibilityBadge(
                          isPrivateProfile: false,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ExperienceBadge(
                          profileLevel: 122,
                          prestigeLevel: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
