import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/utils/constants.dart';

class NetworkNotification extends StatelessWidget {
  const NetworkNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (BuildContext context) =>
          NetworkConnectionBloc()..add(const CheckNetworkConnection()),
      child: BlocBuilder<NetworkConnectionBloc, NetworkConnectionState>(
        builder: (context, state) {
          if (state is NoNetworkConnection) {
            return Container(
              width: double.infinity,
              height: 22,
              color: Theme.of(context).errorColor,
              alignment: Alignment.center,
              child: const Text(
                Constants.networkUnavailableMessage,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
