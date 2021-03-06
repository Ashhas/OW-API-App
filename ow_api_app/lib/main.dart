import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ow_api_app/ui/navbar/nav_bar_screen.dart';
import 'package:ow_api_app/bloc/profile/profile_bloc.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';


void main() async {
  // Hive initialization
  await Hive.initFlutter();

  // Start the applications
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OW-API',
      home: BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(repository: ProfileRepositoryImpl()),
          child: NavBarScreen()),
    );
  }
}
