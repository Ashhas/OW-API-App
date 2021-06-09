import 'package:flutter/material.dart';
import 'package:ow_api_app/ui/settings/widgets/settings_switch_tile.dart';
import 'package:ow_api_app/ui/settings/widgets/settings_tile.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen();

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool turnOnDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            _darkThemeTile(),
          ],
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
        "Setting",
        style: Theme.of(context).primaryTextTheme.headline4,
      ),
    );
  }

  Widget _darkThemeTile() {
    return SettingsSwitchTile(
      title: "Dark Theme",
      switchValue: turnOnDarkTheme,
      onToggle: (bool value) {
        setState(() {
          turnOnDarkTheme = value;
        });
      },
    );
  }
}
