import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MostPlayedHeroesCard extends StatefulWidget {
  final PersistentTabController navBarController;

  const MostPlayedHeroesCard({@required @required this.navBarController})
      : super();

  @override
  _MostPlayedHeroesCardState createState() => _MostPlayedHeroesCardState();
}

class _MostPlayedHeroesCardState extends State<MostPlayedHeroesCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is ProfileLoadedState) {
        return state.profileStats.private
            ? Expanded(
                child: Container(
                    color: Theme.of(context).backgroundColor,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ])))
            : Expanded(
                child: Container(
                  color: Theme.of(context).backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [],
                  ),
                ), //last one
              );
      } else {
        return Container();
      }
    });
  }
}
