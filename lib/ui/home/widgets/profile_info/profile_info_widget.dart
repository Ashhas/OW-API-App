import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/ui/home/widgets/profile_info/account_visibility_badge.dart';
import 'package:ow_api_app/ui/home/widgets/profile_info/endorsement_badge.dart';
import 'package:ow_api_app/ui/home/widgets/profile_info/experience_badge.dart';

class ProfileInfoWidget extends StatefulWidget {
  @override
  _ProfileInfoWidgetState createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is ProfileLoadedState) {
        return Container(
          height: 140,
          width: double.infinity,
          color: Theme.of(context).canvasColor,
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                      height: 95,
                      width: 95,
                      image: NetworkImage(state.profileStats.icon)),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          state.profileStats.name,
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        EndorsementBadge(
                          endorsementLevel: state.profileStats.endorsement,
                          endorsementIcon: state.profileStats.endorsementIcon,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AccountVisibilityBadge(
                          isPrivateProfile: state.profileStats.private,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ExperienceBadge(
                          profileLevel: state.profileStats.level,
                          prestigeLevel: state.profileStats.prestige,
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
