import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/about/about_bloc.dart';
import 'package:ow_api_app/util/constants/variable_const.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ow_api_app/ui/settings/widgets/tiles/settings_tile.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen();

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    BlocProvider.of<AboutBloc>(context).add(LoadAboutData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        child: BlocBuilder<AboutBloc, AboutState>(
          builder: (context, aboutState) {
            return Column(
              children: [
                _githubTile(),
                Divider(height: 1, thickness: 1),
                _versionTile(aboutState.appVersion),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 1,
      toolbarHeight: 180,
      backgroundColor: Theme.of(context).canvasColor,
      leading: Container(),
      flexibleSpace: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Theme.of(context).cardColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 10),
                Text(
                  "About",
                  style: Theme.of(context).primaryTextTheme.headline6,
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

  Widget _githubTile() {
    return SettingsTile(
      title: "Github",
      titleTextStyle: Theme.of(context).primaryTextTheme.subtitle2,
      leading: Icon(Icons.developer_board_outlined,
          color: Theme.of(context).buttonColor),
      onPressed: (BuildContext context) {
        _launchURL();
      },
    );
  }

  Widget _versionTile(String appVersion) {
    return SettingsTile(
      title: "Version",
      titleTextStyle: Theme.of(context).primaryTextTheme.subtitle2,
      subtitle: appVersion,
      subtitleTextStyle: Theme.of(context).primaryTextTheme.bodyText1,
      onPressed: (BuildContext context) {},
    );
  }

  void _launchURL() async {
    await canLaunch(VariableConst.githubUrl)
        ? await launch(VariableConst.githubUrl)
        : throw 'Could not launch ' + VariableConst.githubUrl;
  }
}
