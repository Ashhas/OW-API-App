import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/util/exception/api_exception_mapper.dart';
import 'package:ow_api_app/util/constants/ui_const.dart';

class AddProfileScreen extends StatefulWidget {
  AddProfileScreen() : super();

  @override
  _AddProfileScreenState createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  final TextEditingController accountIdController = TextEditingController();

  //ToggleButtons Values
  List<bool> isSelected = [false, false, false, false];
  List<String> buttonValue = ["pc", "psn", "xbl", "nintendo-switch"];
  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  FocusNode focusNodeButton3 = FocusNode();
  FocusNode focusNodeButton4 = FocusNode();
  List<FocusNode> focusToggle;

  //Platform Variables
  String selectedPlatform;
  bool pcBtnSelected = false;
  bool psnBtnSelected = false;
  bool xblBtnSelected = false;
  bool switchBtnSelected = false;

  //Feedback Variables
  bool duplicateProfile = false;
  bool hasError = false;
  bool hasFeedback = false;
  bool allFilledIn = true;

  //Network Variables
  ConnectivityResult netResult;
  bool networkAvailable = true;

  @override
  void initState() {
    BlocProvider.of<NetworkConnectionBloc>(context)
        .add(UpdateNetworkConnection());
    focusToggle = [
      focusNodeButton1,
      focusNodeButton2,
      focusNodeButton3,
      focusNodeButton4,
    ];
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
              } else if (state is SettingsErrorState) {
                setState(() {
                  hasError = true;

                  _showErrorMessage(state.exception);
                });
              } else if (state is DuplicateProfileState) {
                setState(() {
                  duplicateProfile = true;

                  _showDuplicateMessage();
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
                          ToggleButtons(
                            selectedColor: Colors.white,
                            borderColor: Colors.white,
                            fillColor: Colors.white,
                            borderWidth: 5,
                            selectedBorderColor: Theme.of(context).primaryColor,
                            renderBorder: true,
                            disabledColor: Colors.white,
                            disabledBorderColor: Colors.white,
                            focusNodes: focusToggle,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/platformIcon/battle_net_icon.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/platformIcon/nintendo_switch_icon.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/platformIcon/playstation_icon.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/platformIcon/xbox_icon.png'),
                                  ),
                                ),
                              ),
                            ],
                            isSelected: isSelected,
                            onPressed: (int index) {
                              setState(() {
                                for (int buttonIndex = 0;
                                    buttonIndex < isSelected.length;
                                    buttonIndex++) {
                                  if (buttonIndex == index) {
                                    //Show Selected
                                    isSelected[buttonIndex] =
                                        !isSelected[buttonIndex];

                                    //Set Value
                                    selectedPlatform = buttonValue[buttonIndex];
                                    print(selectedPlatform);
                                  } else {
                                    isSelected[buttonIndex] = false;
                                  }
                                }
                              });
                            },
                          ),
                          SizedBox(height: 20),
                          _feedbackMessageWidgets(),
                          SizedBox(height: 20),
                          AspectRatio(
                            aspectRatio: 20 / 3,
                            child: ElevatedButton(
                              onPressed: () {
                                if (accountIdController.text.isEmpty ||
                                    selectedPlatform == null) {
                                  setState(() {
                                    _showNotFilledInMessage();
                                  });
                                } else {
                                  if (netResult != ConnectivityResult.none) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());

                                    BlocProvider.of<SettingsBloc>(context).add(
                                      AddProfile(
                                          profileId: accountIdController.text,
                                          platformId: selectedPlatform),
                                    );
                                  }
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
          child: Icon(Icons.close, color: Theme.of(context).buttonColor)),
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

  _feedbackMessageWidgets() {
    return Column(
      children: [
        Visibility(
          visible: !allFilledIn,
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Not everything has been filled in",
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: hasError,
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Profile has not been found",
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: duplicateProfile,
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Profile already registered!",
                  style: Theme.of(context).primaryTextTheme.subtitle2,
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
                  style: Theme.of(context).primaryTextTheme.subtitle2,
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
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _showFeedbackMessage() {
    Future.delayed(Duration(seconds: 6)).then((value) => {
          setState(() {
            hasFeedback = false;
          })
        });
  }

  _showNotFilledInMessage() {
    setState(() {
      allFilledIn = false;
    });
  }

  _showDuplicateMessage() {
    Future.delayed(Duration(seconds: 6)).then((value) => {
          setState(() {
            duplicateProfile = false;
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
