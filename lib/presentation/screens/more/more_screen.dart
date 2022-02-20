import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/bottom_navigation/bottom_navigation_cubit.dart.dart';
import 'package:ow_api_app/bloc/more/more_bloc.dart';
import 'package:ow_api_app/presentation/screens/about/about_screen.dart';
import 'package:ow_api_app/presentation/widgets/more/add_account_tile.dart';
import 'package:ow_api_app/presentation/widgets/more/available_accounts_widget.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Accounts',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Theme.of(context).canvasColor,
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
            children: [
              const AvailableAccountsWidget(),
              const AddAccountTile(),
              ListTile(
                title: Text(
                  'About',
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
                leading: Icon(
                  Icons.info_outline,
                  color: Theme.of(context).primaryColor,
                ),
                tileColor: Theme.of(context).cardColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutScreen(),
                    ),
                  );
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
                indent: 70,
                color: Theme.of(context).dividerColor,
              ),
              ListTile(
                title: Text(
                  'Help/FAQ',
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
                leading: Icon(
                  Icons.contact_support_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                tileColor: Theme.of(context).cardColor,
              ),
              Divider(
                height: 1,
                thickness: 1,
                indent: 70,
                color: Theme.of(context).dividerColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
