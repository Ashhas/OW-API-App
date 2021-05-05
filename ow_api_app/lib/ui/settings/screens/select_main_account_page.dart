import 'package:flutter/material.dart';
import 'package:ow_api_app/data/util/strings.dart';

class SelectMainAccountPage extends StatefulWidget {
  @override
  _SelectMainAccountPageState createState() => _SelectMainAccountPageState();
}

class _SelectMainAccountPageState extends State<SelectMainAccountPage> {
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
        GlobalVariables.settingsMainAccountTitle,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "TitilliumWeb",
            fontWeight: FontWeight.w500,
            fontSize: 25),
      ),
    );
  }
}
