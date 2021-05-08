import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/ui/navbar/nav_bar_screen.dart';
import 'package:ow_api_app/ui/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitializationBloc, InitializationState>(
      builder: (context, state) {
        if (state is NoNetworkOnStartup) {
          return _buildOfflineWidget();
        } else if (state is InitializationStartedState) {
          return Container(color: Colors.deepOrangeAccent);
        } else if (state is UninitializedState) {
          return OnBoardingScreen();
        } else if (state is InitializedState) {
          return BottomNavBar();
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildOfflineWidget() {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_off, color: Colors.white),
          Text(
            "No Internet Connection",
            style: Theme.of(context).primaryTextTheme.bodyText2,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              //Add New Reload w/ network
              BlocProvider.of<InitializationBloc>(context).add(
                ReloadWithNetwork(),
              );
            },
            child: Text(
              "Reload",
              style: Theme.of(context).primaryTextTheme.button,
            ),
          ),
        ],
      )),
    );
  }
}
