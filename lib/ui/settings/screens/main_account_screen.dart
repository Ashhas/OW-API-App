import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/data/model/account.model.dart';
import 'package:ow_api_app/util/constants/ui_const.dart';

class SelectMainAccountScreen extends StatefulWidget {
  SelectMainAccountScreen();

  @override
  _SelectMainAccountScreenState createState() =>
      _SelectMainAccountScreenState();
}

class _SelectMainAccountScreenState extends State<SelectMainAccountScreen> {
  AccountModel selectedMainAccount;

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
                        return Text(UiConst.settingsNoAccountTitle);
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
                                    .bodyText2,
                              ),
                              value: account,
                              groupValue: selectedMainAccount,
                              onChanged: (val) {
                                setState(
                                  () {
                                    selectedMainAccount = val;
                                    BlocProvider.of<SettingsBloc>(context).add(
                                      SaveMainAccount(
                                        battleNetId:
                                            selectedMainAccount.battleNetId,
                                        platformId:
                                            selectedMainAccount.platformId,
                                      ),
                                    );
                                  },
                                );
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
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).buttonColor,
        ),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context, selectedMainAccount);
        },
      ),
      title: Text(
        UiConst.settingsMainAccountTitle,
        style: Theme.of(context).primaryTextTheme.headline4,
      ),
    );
  }
}
