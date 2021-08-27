import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen();

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _buildAppBar(),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoadedState) {
            return Container(
              width: double.infinity,
              child: Column(
                children: [],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Theme.of(context).canvasColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).buttonColor,
        ),
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
}
