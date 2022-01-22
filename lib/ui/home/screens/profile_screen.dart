import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/ui/home/widgets/network_notification.dart';
import 'package:ow_api_app/ui/home/widgets/profile_info/profile_info_widget.dart';
import 'package:ow_api_app/ui/home/widgets/statistics/statistics_card.dart';

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
          child: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        NetworkNotification(networkResult: netResult),
                        ProfileInfoWidget(),
                        StatisticsCard()
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
