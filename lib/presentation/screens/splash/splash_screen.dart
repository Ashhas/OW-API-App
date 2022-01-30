import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/presentation/screens/bottom_navigation/bottom_navigation.dart';
import 'package:ow_api_app/presentation/screens/offline/offline_screen.dart';
import 'package:ow_api_app/presentation/screens/onboarding/onboarding_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitializationBloc, InitializationState>(
      builder: (context, initState) {
        if (initState is InitializationStartedState) {
          return Container(color: Colors.deepOrangeAccent);
        } else if (initState is NoNetworkOnStartup) {
          return const OfflineScreen();
        } else if (initState is UninitializedState) {
          return const OnBoardingScreen();
        } else if (initState is InitializedState) {
          return const BottomNavigation();
        } else {
          return Container();
        }
      },
    );
  }
}
