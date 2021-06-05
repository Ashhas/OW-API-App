import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:ow_api_app/bloc/network_connection/network_connection_bloc.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/util/api_exception_mapper.dart';
import 'package:ow_api_app/util/strings.dart';

class AddProfilePage extends StatefulWidget {
  AddProfilePage() : super();

  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  final textController = TextEditingController();
  bool hasError = false;
  bool hasFeedback = false;
  String selectedPlatform;
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
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      body: BlocListener<NetworkConnectionBloc, NetworkConnectionState>(
        listener: (context, networkState) {
          if (networkState is NetworkConnectionUpdatedState) {
            setState(() {
              netResult = networkState.connectivityResult;
              networkAvailable = true;
            });
          } else if (networkState is NoNetworkConnectionState) {
            setState(() {
              netResult = networkState.connectivityResult;
              networkAvailable = false;
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
          child: Column(
            children: [
              _networkNotification(netResult),
              _buildAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Enter BattleTag",
                          style: Theme.of(context).primaryTextTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: textController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Color(0xfff3f3f4),
                              filled: true),
                        ),
                        Text("Please enter a valid BattleTag (Battletag#1234)",
                            style:
                                Theme.of(context).primaryTextTheme.bodyText1),
                        SizedBox(
                          height: 20,
                        ),
                        DropDown<String>(
                          items: GlobalVariables.availablePlatforms,
                          hint: Text("Platform",
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1),
                          onChanged: (String p) {
                            print("Chosen Platform: " + p);
                            setState(() {
                              selectedPlatform = p;
                            });
                          },
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
                                      .headline1,
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
                                      .headline1,
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !networkAvailable,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Center(
                                child: Text(
                                  "No internet connection",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline1,
                                ),
                              )
                            ],
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 20 / 3,
                          child: ElevatedButton(
                            onPressed: () {
                              if (networkAvailable) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                //Add New Event
                                BlocProvider.of<SettingsBloc>(context).add(
                                  AddProfile(
                                      profileId: textController.text,
                                      platformId: selectedPlatform),
                                );
                              }
                            },
                            child: Text(
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
                  ],
                ),
              ),
            ],
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
        height: 40,
        color: Colors.red,
        alignment: Alignment.bottomCenter,
        child: Text(
          GlobalVariables.networkUnavailableMessage,
          style: Theme.of(context).primaryTextTheme.bodyText1,
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
