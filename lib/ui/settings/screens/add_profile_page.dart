import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/ui/settings/widgets/widget_btn_pc.dart';
import 'package:ow_api_app/ui/settings/widgets/widget_btn_psn.dart';
import 'package:ow_api_app/ui/settings/widgets/widget_btn_switch.dart';
import 'package:ow_api_app/ui/settings/widgets/widget_btn_xbl.dart';
import 'package:ow_api_app/util/exception/api_exception_mapper.dart';
import 'package:ow_api_app/util/constants/ui_const.dart';

class AddProfilePage extends StatefulWidget {
  AddProfilePage() : super();

  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  final TextEditingController accountIdController = TextEditingController();

  //Platform Variables
  String selectedPlatform;
  bool pcBtnSelected = false;
  bool psnBtnSelected = false;
  bool xblBtnSelected = false;
  bool switchBtnSelected = false;

  //Feedback Variables
  bool hasError = false;
  bool hasFeedback = false;

  //Network Variables
  ConnectivityResult netResult;
  bool networkAvailable = true;

  @override
  void initState() {
    BlocProvider.of<NetworkConnectionBloc>(context)
        .add(UpdateNetworkConnection());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: BlocListener<NetworkConnectionBloc, NetworkConnectionState>(
          listener: (context, networkState) {
            if (networkState is NetworkConnectionUpdatedState) {
              setState(() {
                netResult = networkState.connectivityResult;
              });
            } else if (networkState is NoNetworkConnectionState) {
              setState(() {
                netResult = networkState.connectivityResult;
              });
            }
          },
          child: BlocListener<SettingsBloc, SettingsState>(
            listener: (context, state) {
              if (state is ProfileValidatedState) {
                Navigator.pop(context);
              }
              if (state is ProfileNotValidatedState) {
                setState(() {
                  hasFeedback = true;

                  _showFeedbackMessage();
                });
              }
              if (state is SettingsErrorState) {
                setState(() {
                  hasError = true;

                  _showErrorMessage(state.exception);
                });
              }
            },
            child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    _networkNotification(netResult),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 80,
                          ),
                          Text(
                            "Enter BattleTag",
                            style: Theme.of(context).primaryTextTheme.bodyText2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: accountIdController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true),
                          ),
                          Text(
                              "Please enter a valid BattleTag (Battletag#1234)",
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Select a Platform",
                            style: Theme.of(context).primaryTextTheme.bodyText2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              children: <Widget>[
                                WidgetBtnPc(
                                    selected: pcBtnSelected,
                                    onPressed: (BuildContext context) {
                                      selectedPlatform = "pc";
                                      pcBtnSelected = true;
                                    }),
                                SizedBox(width: 20),
                                WidgetBtnPsn(
                                    selected: psnBtnSelected,
                                    onPressed: (BuildContext context) {
                                      selectedPlatform = "psn";
                                      pcBtnSelected = true;
                                    }),
                                SizedBox(width: 20),
                                WidgetBtnXbox(
                                    selected: xblBtnSelected,
                                    onPressed: (BuildContext context) {
                                      selectedPlatform = "xbl";
                                      pcBtnSelected = true;
                                    }),
                                SizedBox(width: 20),
                                WidgetBtnSwitch(
                                    selected: switchBtnSelected,
                                    onPressed: (BuildContext context) {
                                      selectedPlatform = "nintendo-switch";
                                      pcBtnSelected = true;
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            visible: hasError,
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    "Profile has not been found",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle2,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: hasFeedback,
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    "Profile has not been found",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle2,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: netResult == ConnectivityResult.none,
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    "No internet connection",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle2,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          AspectRatio(
                            aspectRatio: 20 / 3,
                            child: ElevatedButton(
                              onPressed: () {
                                if (netResult != ConnectivityResult.none) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  //Add New Event
                                  BlocProvider.of<SettingsBloc>(context).add(
                                    AddProfile(
                                        profileId: accountIdController.text,
                                        platformId: selectedPlatform),
                                  );
                                }
                              },
                              child: state is ValidatingProfileState
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    )
                                  : Text(
                                      "Send",
                                      style: TextStyle(color: Colors.white),
                                    ),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).accentColor,
                                onPrimary: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      leading: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pop(context);
          },
          child: Icon(Icons.close, color: Colors.black)),
      elevation: 0.0,
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  _networkNotification(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      return Container(
        width: double.infinity,
        height: 22,
        color: Theme.of(context).errorColor,
        alignment: Alignment.center,
        child: Text(
          UiConst.networkUnavailableMessage,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      );
    } else {
      return Container();
    }
  }

  _showFeedbackMessage() {
    Future.delayed(Duration(seconds: 6)).then((value) => {
          setState(() {
            hasFeedback = false;
          })
        });
  }

  _showErrorMessage(Exception e) {
    print(
      ApiExceptionMapper.toErrorMessage(e),
    );

    Future.delayed(Duration(seconds: 6)).then((value) => {
          setState(() {
            hasError = false;
          })
        });
  }
}
