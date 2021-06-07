import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/ui/home/widgets/profile_info_card_widget.dart';
import 'package:ow_api_app/ui/home/widgets/profile_most_played_hero_widget.dart';
import 'package:ow_api_app/ui/home/widgets/rank_rating_widget.dart';
import 'package:ow_api_app/util/constants/ui_const.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen() : super();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ConnectivityResult netResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SafeArea(
        child: BlocListener<NetworkConnectionBloc, NetworkConnectionState>(
          listener: (context, state) {
            if (state is NetworkConnectionUpdatedState) {
              setState(() {
                netResult = state.connectivityResult;
              });
            } else if (state is NoNetworkConnectionState) {
              setState(() {
                netResult = state.connectivityResult;
              });
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _networkNotification(netResult),
              ProfileInfoCard(),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is ProfileLoadedState) {
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: state.profileStats.private
                            ? Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                    left: 20, top: 5, right: 20),
                                child: Column(
                                  children: [
                                    RankRatingWidget(),
                                    Divider(
                                      color: Color(0xFFC7CEDB),
                                    ),
                                    MostPlayedHeroes(),
                                    Divider(
                                      color: Color(0xFFC7CEDB),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _networkNotification(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      return Container(
        width: double.infinity,
        height: 22,
        color: Theme.of(context).errorColor,
        alignment: Alignment.center,
        child: Text(
          UiConst.networkUnavailableMessage,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      );
    } else {
      return Container();
    }
  }
}
