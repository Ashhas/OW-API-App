import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/bottomNavigation/nav_bar_bloc.dart';
import 'package:ow_api_app/bloc/bottomNavigation/nav_bar_event.dart';
import 'package:ow_api_app/bloc/bottomNavigation/nav_bar_state.dart';

import 'package:ow_api_app/bloc/profile/profile_bloc.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/ui/home/home_page.dart';
import 'package:ow_api_app/ui/navbar/app.dart';
import 'package:ow_api_app/ui/navbar/nav_bar_screen.dart';

void main() async {
  //   hive initialization
  await Hive.initFlutter();

  //Start app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'OW-API',
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  NavBarBloc(PageLoading())..add(HomeStarted()),
            ),
            BlocProvider(
              create: (context) =>
                  ProfileBloc(repository: ProfileRepositoryImpl()),
            )
          ],
          child: NavBarScreen(),
        ));
  }
}
