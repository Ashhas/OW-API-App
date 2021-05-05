import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:ow_api_app/bloc/settings/settings_bloc.dart';
import 'package:ow_api_app/data/util/api_exception_mapper.dart';
import 'package:ow_api_app/data/util/strings.dart';

class AddProfilePage extends StatefulWidget {
  AddProfilePage() : super();

  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  final textController = TextEditingController();
  String selectedPlatform;
  bool isLoading = false;
  bool hasError = false;
  bool hasFeedback = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: new AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: BlocListener<SettingsBloc, SettingsState>(
            listener: (context, state) {
              if (state is ProfileValidatedState) {
                Navigator.pop(context);
              }
              if (state is SettingsErrorState) {
                setState(() {
                  isLoading = false;
                  hasError = true;

                  showErrorMessage(state.exception);
                });
              }
            },
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Enter BattleTag",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "TitilliumWeb",
                                fontWeight: FontWeight.w700,
                              )),
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
                                  filled: true)),
                          Text(
                              "Please enter a valid BattleTag (Battletag#1234)",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "TitilliumWeb",
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          DropDown<String>(
                            items: GlobalVariables.availablePlatforms,
                            hint: Text("Platform",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "TitilliumWeb",
                                  fontWeight: FontWeight.w500,
                                )),
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
                          AspectRatio(
                            aspectRatio: 20 / 3,
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  if (selectedPlatform == null) {
                                    hasFeedback = true;
                                    showFeedbackMessage();
                                  } else {
                                    //Start Loading Widget
                                    isLoading = true;

                                    //Add New Event
                                    BlocProvider.of<SettingsBloc>(context).add(
                                      AddProfile(
                                          profileId: textController.text,
                                          platformId: selectedPlatform),
                                    );
                                  }
                                });
                              },
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Send",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .button,
                                        )
                                      ],
                                    ),
                              color: Colors.lightBlue,
                            ),
                          ),
                          hasError
                              ? Center(
                                  child: Text(
                                    "Profile has not been found",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              : Container(),
                          hasFeedback
                              ? Center(
                                  child: Text(
                                    "Fill in the form completely",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  showFeedbackMessage() {
    Future.delayed(Duration(seconds: 6)).then((value) => {
          setState(() {
            hasFeedback = false;
          })
        });
  }

  showErrorMessage(Exception e) {
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
