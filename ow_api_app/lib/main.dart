import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/bloc/on_boarding/on_boarding_bloc.dart';
import 'package:ow_api_app/bloc/simple_bloc_observer.dart';
import 'package:ow_api_app/data/util/themes.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Bloc Observer
  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileRepository profileRepository = ProfileRepository();

    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ProfileRepository>(
            create: (context) => profileRepository,
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<InitializationBloc>(
                create: (_) => InitializationBloc()..add(AppStarted()),
              ),
              BlocProvider<OnBoardingBloc>(
                create: (_) => OnBoardingBloc(repository: profileRepository),
              ),
              BlocProvider<SettingsBloc>(
                create: (_) => SettingsBloc(repository: profileRepository),
              ),
              BlocProvider<HomeBloc>(
                create: (_) => HomeBloc(
                  repository: profileRepository,
                ),
              ),
            ],
            child: MaterialApp(
              title: 'OW-API',
              theme: AppThemes.getDarkTheme(),
              home: SplashScreen(),
            )));
  }
}
