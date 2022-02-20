import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ow_api_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/bloc/more/more_bloc.dart';
import 'package:ow_api_app/bloc/on_boarding/on_boarding_bloc.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/presentation/screens/bottom_navigation/bottom_navigation.dart';
import 'package:ow_api_app/presentation/screens/offline/offline_screen.dart';
import 'package:ow_api_app/presentation/screens/onboarding/onboarding_container.dart';
import 'package:ow_api_app/presentation/screens/splash/splash_screen.dart';
import 'package:ow_api_app/bloc/bottom_navigation/bottom_navigation_cubit.dart.dart';
import 'package:ow_api_app/bloc/simple_bloc_observer.dart';
import 'package:ow_api_app/theme/app_themes.dart';
import 'package:ow_api_app/utils/constants.dart';

import 'bloc/about/about_cubit.dart';
import 'bloc/add_profile/add_profile_bloc.dart';
import 'data/model/account.model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set Orientation and Run App
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Init Hive
  await Hive.initFlutter();
  Hive.registerAdapter(AccountModelAdapter());
  await Hive.openBox<AccountModel>(Constants.accountBoxId);

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
          create: (context) => OnBoardingBloc(
            repository: ProfileRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => DashboardBloc(
            repository: ProfileRepository(),
          )..add(OpenDashboard()),
        ),
        BlocProvider(
          create: (context) => MoreBloc(
            repository: ProfileRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => AboutCubit(),
        ),
        BlocProvider(
          create: (context) => AddProfileBloc(
            repository: ProfileRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        title: Constants.appName,
        theme: AppThemes.getDefaultTheme(),
        home: BlocBuilder<InitializationBloc, InitializationState>(
          builder: (context, initState) {
            if (initState is InitializationInitial) {
              return const SplashScreen();
            } else if (initState is NoNetworkOnStartup) {
              return const OfflineScreen();
            } else if (initState is Uninitialized) {
              return const OnBoardingScreen();
            } else if (initState is Initialized) {
              return const BottomNavigation();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
