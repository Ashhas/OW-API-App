import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/ui/home/home_page.dart';

import 'package:ow_api_app/ui/navbar/nav_bar_screen.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/ui/settings/add_profile_page.dart';

void main() async {
  // Hive initialization
  await Hive.initFlutter();

  // Start the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SettingsBloc>(
            create: (_) => SettingsBloc()..add(SettingsOpenedEvent()),
          ),
          BlocProvider(
            create: (_) => HomeBloc(repository: ProfileRepositoryImpl())
              ..add(HomeStartedEvent()),
          ),
        ],
        child: MaterialApp(
          home: NavBarScreen(),
        ));
  }
}
