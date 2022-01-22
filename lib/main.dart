import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/about/about_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/bloc/main_account/main_account_bloc.dart';
import 'package:ow_api_app/bloc/navigation/navigation_bar_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/bloc/on_boarding/on_boarding_bloc.dart';
import 'package:ow_api_app/bloc/simple_bloc_observer.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/theme/theme_const.dart';
import 'package:ow_api_app/ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Bloc Observer
  Bloc.observer = SimpleBlocObserver();

  //Set Orientation and Run App
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileRepository profileRepository = ProfileRepository();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProfileRepository>(
            create: (context) => profileRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NetworkConnectionBloc>(
            create: (_) => NetworkConnectionBloc(),
          ),
          BlocProvider<InitializationBloc>(
            create: (_) => InitializationBloc()..add(InitializeApp()),
          ),
          BlocProvider<NavigationBarBloc>(
            create: (_) => NavigationBarBloc(),
          ),
          BlocProvider<OnBoardingBloc>(
            create: (_) => OnBoardingBloc(repository: profileRepository),
          ),
          BlocProvider<DashboardBloc>(
            create: (_) => DashboardBloc(repository: profileRepository),
          ),
          BlocProvider<SettingsBloc>(
            create: (_) => SettingsBloc(repository: profileRepository),
          ),
          BlocProvider<AboutBloc>(
            create: (_) => AboutBloc(),
          ),
          BlocProvider<MainAccountBloc>(
            create: (_) => MainAccountBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'OW-API',
          theme: AppTheme.getDefaultTheme(),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
