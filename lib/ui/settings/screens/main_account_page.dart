import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/util/strings.dart';

class SelectMainAccountPage extends StatefulWidget {
  final String mainAccount;

  SelectMainAccountPage({@required this.mainAccount});

  @override
  _SelectMainAccountPageState createState() => _SelectMainAccountPageState();
}

class _SelectMainAccountPageState extends State<SelectMainAccountPage> {
  String selectedMainAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is SettingsLoadedState) {
              return Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: state.allAccounts.listenable(),
                    builder: (context, box, widget) {
                      if (box.values.isEmpty) {
                        return Text(GlobalVariables.settingsNoAccountTitle);
                      } else {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: box.values.length,
                          itemBuilder: (context, index) {
                            AccountModel account = box.getAt(index);

                            return RadioListTile(
                              title: Text(
                                account.battleNetId,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline5,
                              ),
                              value: account.battleNetId,
                              groupValue: selectedMainAccount,
                              onChanged: (val) {
                                setState(() {
                                  selectedMainAccount = val;
                                  BlocProvider.of<SettingsBloc>(context).add(
                                    SaveMainAccount(
                                      battleNetId: val,
                                    ),
                                  );
                                });
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Theme.of(context).canvasColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context, selectedMainAccount);
        },
      ),
      title: Text(
        GlobalVariables.settingsMainAccountTitle,
        style: Theme.of(context).primaryTextTheme.headline2,
      ),
    );
  }
}
