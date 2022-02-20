import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/about/about_cubit.dart';
import 'package:ow_api_app/utils/constants.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late AboutCubit aboutCubit = BlocProvider.of(context);
  String versionNumber = '';

  Future<String> getVersionNumber() async {
    return await aboutCubit.getAppInformation();
  }

  @override
  Widget build(BuildContext context) {
    getVersionNumber().then((value) => setState(() {
          versionNumber = value;
        }));

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _buildAppBar(context: context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ListTile(
              title: const Text(
                Constants.githubLabel,
              ),
              subtitle: Text(
                Constants.githubUrl,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onTap: () {
                aboutCubit.launchUrl(Constants.githubUrl);
              },
            ),
            const Divider(height: 1, thickness: 1),
            ListTile(
              title: const Text(
                Constants.versionLabel,
              ),
              subtitle: Text(
                versionNumber,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar({required BuildContext context}) {
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
                  Constants.aboutLabel,
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
              Constants.appName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
