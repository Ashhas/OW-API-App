import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/profile/profile_bloc.dart';
import 'package:ow_api_app/data/repository/profile_repository.dart';
import 'package:ow_api_app/ui/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OW-API',
      home: BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(repository: ProfileRepositoryImpl()),
          child: HomePage()),
    );
  }
}
