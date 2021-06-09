import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/ui/navbar/nav_bar_screen.dart';
import 'package:ow_api_app/ui/onboarding/onboarding_screen.dart';
import 'package:ow_api_app/ui/splash/screens/offline_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitializationBloc, InitializationState>(
      builder: (context, state) {
        if (state is InitializationStartedState) {
          return Container(color: Colors.deepOrangeAccent);
        } else if (state is NoNetworkOnStartup) {
          return OfflineScreen();
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
}
