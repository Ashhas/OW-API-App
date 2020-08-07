import 'package:flutter/material.dart';
import 'ui/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Mainscreen': (BuildContext context) => new HomeScreen()
  };

  Routes () {
    runApp(new MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      home: new HomeScreen(),
    ));
  }
}