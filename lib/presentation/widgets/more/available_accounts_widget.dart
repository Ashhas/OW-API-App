import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/add_profile/add_profile_bloc.dart';
import 'package:ow_api_app/bloc/bottom_navigation/bottom_navigation_cubit.dart.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:ow_api_app/bloc/more/more_bloc.dart';

class AvailableAccountsWidget extends StatefulWidget {
  const AvailableAccountsWidget({Key? key}) : super(key: key);

  @override
  _AvailableAccountsWidgetState createState() =>
      _AvailableAccountsWidgetState();
}

class _AvailableAccountsWidgetState extends State<AvailableAccountsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProfileBloc, AddProfileState>(
      listener: (context, state) {
        if (state is ProfileValidated) {
          BlocProvider.of<MoreBloc>(context).add(const LoadSavedProfiles());
        }
      },
      child: BlocBuilder<MoreBloc, MoreState>(
        builder: (context, state) {
          if (state is ProfilesLoaded) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.allAccounts.length,
              itemBuilder: (context, index) {
                var account = state.allAccounts[index];

                return ListTile(
                  title: Text(
                    account.battleNetId,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                  tileColor: Theme.of(context).canvasColor,
                  trailing: account.battleNetId != state.mainAccount
                      ? const SizedBox(width: 10)
                      : IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Theme.of(context).cardColor,
                          ),
                          iconSize: 25,
                          color: Colors.black,
                          onPressed: () {},
                        ),
                  onTap: () {
                    BlocProvider.of<DashboardBloc>(context).add(
                      ChangeSelectedProfile(
                        profileId: account.battleNetId,
                        platformId: account.platformId,
                      ),
                    );
                    BlocProvider.of<BottomNavigationCubit>(context)
                        .updateSelectedIndex(0);
                  },
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
