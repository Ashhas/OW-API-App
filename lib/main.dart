import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/bloc/more/more_bloc.dart';
import 'package:ow_api_app/bloc/on_boarding/on_boarding_bloc.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/presentation/screens/splash/splash_screen.dart';
import 'package:ow_api_app/theme/theme_const.dart';
import 'package:ow_api_app/bloc/bottom_navigation/bottom_navigation_cubit.dart.dart';
import 'package:ow_api_app/bloc/simple_bloc_observer.dart';

import 'bloc/add_profile/add_profile_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Set Orientation and Run App
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InitializationBloc()..add(StartApp()),
        ),
        BlocProvider<BottomNavigationCubit>(
          create: (context) => BottomNavigationCubit(),
        ),
        BlocProvider(
          create: (context) => OnBoardingBloc(repository: ProfileRepository()),
        ),
        BlocProvider(
          create: (context) => DashboardBloc(repository: ProfileRepository())
            ..add(OpenDashboard()),
        ),
        BlocProvider(
          create: (context) => MoreBloc(repository: ProfileRepository()),
        ),
        BlocProvider(
          create: (context) => AddProfileBloc(repository: ProfileRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'OW-API',
        theme: AppTheme.getDefaultTheme(),
        home: const SplashScreen(),
      ),
    );
  }
}
