import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage();

  @override
  _AboutPagePageState createState() => _AboutPagePageState();
}

class _AboutPagePageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        child: Center(
          child: Text("About"),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Theme.of(context).canvasColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "About",
        style: Theme.of(context).primaryTextTheme.headline4,
      ),
    );
  }
}
