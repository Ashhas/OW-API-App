import 'package:ow_api_app/bloc/profile/profile_bloc.dart';
import 'package:ow_api_app/bloc/profile/profile_event.dart';
import 'package:ow_api_app/bloc/profile/profile_state.dart';
import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProfileBloc profileBloc;

  @override
  void initState() {
    super.initState();
    profileBloc = BlocProvider.of<ProfileBloc>(context);
    profileBloc.add(FetchProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Overwatch SR"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      profileBloc.add(FetchProfileEvent());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {},
                  )
                ],
              ),
              body: Container(
                child: BlocListener<ProfileBloc, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileInitialState) {
                        return buildLoading();
                      } else if (state is ProfileLoadingState) {
                        return buildLoading();
                      } else if (state is ProfileLoadedState) {
                        return buildProfile(state.profileStats);
                      } else if (state is ProfileErrorState) {
                        return buildErrorUi(state.message);
                      } else
                        return Container();
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildProfile(Profile profile) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: ListTile(
          leading: ClipOval(
            child: Hero(
              tag: profile.eu.stats.competitive.overallStats.rankImage,
              child: Image.network(
                profile.eu.stats.competitive.overallStats.avatar,
                fit: BoxFit.cover,
                height: 70.0,
                width: 70.0,
              ),
            ),
          ),
          title: Text("Ashhas#2396"),
          subtitle: Text(profile
              .eu.stats.competitive.overallStats.supportComprank
              .toString()),
        ),
        onTap: () {},
      ),
    );
  }
}
