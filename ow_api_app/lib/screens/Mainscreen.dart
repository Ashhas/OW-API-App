import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Mainscreen"),
        ),
        body: new Container(
            child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                )
            )
        )
    );
  }
}