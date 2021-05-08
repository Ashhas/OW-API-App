import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/data/util/strings.dart';
import 'package:ow_api_app/ui/home/widget/profile_info_card_widget.dart';
import 'package:ow_api_app/ui/home/widget/profile_most_played_hero_widget.dart';

class ProfileDisplayWidget extends StatefulWidget {
  const ProfileDisplayWidget() : super();

  @override
  _ProfileDisplayWidgetState createState() => _ProfileDisplayWidgetState();
}

class _ProfileDisplayWidgetState extends State<ProfileDisplayWidget> {
  ConnectivityResult netResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: BlocListener<NetworkConnectionBloc, NetworkConnectionState>(
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _networkNotification(netResult),
            ProfileInfoCard(),
            MostPlayedHeroesCard(),
          ],
        ),
      ),
    );
  }

  _networkNotification(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      return Container(
        width: double.infinity,
        height: 40,
        color: Colors.red,
        alignment: Alignment.bottomCenter,
        child: Text(
          GlobalVariables.networkUnavailableMessage,
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
      );
    } else {
      return Container();
    }
  }
}
