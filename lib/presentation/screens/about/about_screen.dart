import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/about/about_cubit.dart';
import 'package:ow_api_app/presentation/widgets/more/settings_tile.dart';
import 'package:ow_api_app/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _buildAppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            _githubTile(),
            const Divider(height: 1, thickness: 1),
            _versionTile(
              context.read<AboutCubit>().getAppInformation().toString(),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
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
                  icon: const Icon(Icons.arrow_back),
                  color: Theme.of(context).cardColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10),
                Text(
                  "About",
                  style: Theme.of(context).primaryTextTheme.headline6,
                )
              ],
            ),
            const SizedBox(height: 15),
            const SizedBox(
              height: 70,
              width: 70,
              child: Center(
                child: Image(
                  image: AssetImage('assets/overwatch-logo.png'),
                ),
              ),
            ),
            const Text(
              "OW-API",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
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
    await canLaunch(Strings.githubUrl)
        ? await launch(Strings.githubUrl)
        : throw 'Could not launch ' + Strings.githubUrl;
  }
}
