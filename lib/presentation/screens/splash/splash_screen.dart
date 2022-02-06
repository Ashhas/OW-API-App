import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/presentation/screens/bottom_navigation/bottom_navigation.dart';
import 'package:ow_api_app/presentation/screens/offline/offline_screen.dart';
import 'package:ow_api_app/presentation/screens/onboarding/onboarding_container.dart';
import 'package:ow_api_app/theme/color_const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitializationBloc, InitializationState>(
      builder: (context, initState) {
        if (initState is InitializationInitial) {
          return Container(color: ColorConst.lightBackgroundColor);
        } else if (initState is NoNetworkOnStartup) {
          return const OfflineScreen();
        } else if (initState is Uninitialized) {
          return const OnBoardingScreen();
        } else if (initState is Initialized) {
          return const BottomNavigation();
        } else {
          return Container();
        }
      },
    );
  }
}
