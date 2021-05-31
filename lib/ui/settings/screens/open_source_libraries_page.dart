import 'package:flutter/material.dart';
import 'package:ow_api_app/util/strings.dart';

class OpenSourceLibrariesPage extends StatefulWidget {
  @override
  _OpenSourceLibrariesPageState createState() =>
      _OpenSourceLibrariesPageState();
}

class _OpenSourceLibrariesPageState extends State<OpenSourceLibrariesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        GlobalVariables.settingsOpenSourceTitle,
        style: Theme.of(context).primaryTextTheme.headline2,
      ),
    );
  }
}
