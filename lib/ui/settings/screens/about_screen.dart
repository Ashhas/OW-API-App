import 'package:flutter/material.dart';
import 'package:ow_api_app/util/constants/variable_const.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ow_api_app/ui/settings/widgets/settings_tile.dart';

class AboutScreen extends StatefulWidget {
  final String appVersion;

  AboutScreen({@required this.appVersion});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
            SettingsTile(
              title: "Github",
              titleTextStyle: Theme.of(context).primaryTextTheme.headline4,
              leading: Icon(Icons.developer_board_outlined),
              onPressed: (BuildContext context) {
                _launchURL();
              },
            ),
            Divider(height: 1, thickness: 1),
            SettingsTile(
              title: "Version",
              titleTextStyle: Theme.of(context).primaryTextTheme.headline4,
              subtitle: widget.appVersion,
              onPressed: (BuildContext context) {},
            ),
            SettingsTile(
              title: "Open-source licenses",
              titleTextStyle: Theme.of(context).primaryTextTheme.headline4,
              onPressed: (BuildContext context) {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 1,
      toolbarHeight: 180,
      backgroundColor: Theme.of(context).accentColor,
      leading: Container(),
      flexibleSpace: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Theme.of(context).buttonColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 10),
                Text(
                  "About",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 70,
              width: 70,
              child: Center(
                child: Image(
                  image: AssetImage('assets/overwatch-logo.png'),
                ),
              ),
            ),
            Text(
              "OW-API",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    await canLaunch(VariableConst.githubUrl)
        ? await launch(VariableConst.githubUrl)
        : throw 'Could not launch ' + VariableConst.githubUrl;
  }
}
