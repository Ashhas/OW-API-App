import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.signal_wifi_off, color: Theme.of(context).buttonColor),
            Text(
              "No Internet Connection",
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                //Add New Reload w/ network
                BlocProvider.of<InitializationBloc>(context).add(
                  ReloadWithNetwork(),
                );
              },
              child: Text(
                "Reload",
                style: Theme.of(context).primaryTextTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
