import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/ui/home/widgets/profile_info_widget.dart';
import 'package:ow_api_app/ui/home/widgets/statistics_card.dart';
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
          child: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        _networkNotification(netResult),
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
