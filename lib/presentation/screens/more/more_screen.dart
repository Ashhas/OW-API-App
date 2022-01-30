import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/bottom_navigation/bottom_navigation_cubit.dart.dart';
import 'package:ow_api_app/bloc/more/more_bloc.dart';
import 'package:ow_api_app/presentation/screens/about/about_screen.dart';
import 'package:ow_api_app/presentation/widgets/more/add_account_tile.dart';
import 'package:ow_api_app/presentation/widgets/more/available_accounts_widget.dart';
import 'package:ow_api_app/presentation/widgets/more/settings_tile.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  void initState() {
    BlocProvider.of<MoreBloc>(context).add(const LoadSavedProfiles());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          'More',
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocListener<MoreBloc, MoreState>(
        listener: (context, addProfileState) {
          if (addProfileState is ProfileChangedState) {
            BlocProvider.of<BottomNavigationCubit>(context)
                .updateSelectedIndex(0);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AvailableAccountsWidget(),
              AddAccountTile(),
              Divider(height: 1, thickness: 1),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutTile() {
    return SettingsTile(
      title: "About",
      titleTextStyle: Theme.of(context).primaryTextTheme.subtitle2,
      leading: Icon(
        Icons.info_outline,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutScreen()),
        );
      },
    );
  }
}
