import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/utils/constants.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_wifi_off,
              color: Theme.of(context).buttonColor,
            ),
            Text(
              Constants.networkUnavailableMessage,
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<InitializationBloc>(context).add(
                  ReloadWithNetwork(),
                );
              },
              child: Text(
                Constants.reloadLabel,
                style: Theme.of(context).primaryTextTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
