import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/util/constants/ui_const.dart';

class NetworkNotification extends StatelessWidget {
  final ConnectivityResult networkResult;

  const NetworkNotification({@required this.networkResult}) : super();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkConnectionBloc, NetworkConnectionState>(
        builder: (context, state) {
      if (state is NoNetworkConnectionState) {
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
    });
  }
}
