import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/bloc/on_boarding/on_boarding_bloc.dart';
import 'package:ow_api_app/data/util/api_exception_mapper.dart';
import 'package:ow_api_app/data/util/strings.dart';
import 'package:ow_api_app/ui/navbar/nav_bar_screen.dart';

class AddFirstProfilePage extends StatefulWidget {
  AddFirstProfilePage() : super();

  @override
  _AddFirstProfilePageState createState() => _AddFirstProfilePageState();
}

class _AddFirstProfilePageState extends State<AddFirstProfilePage> {
  final textController = TextEditingController();
  bool hasError = false;
  bool hasFeedback = false;
  String selectedPlatform;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: BlocListener<OnBoardingBloc, OnBoardingState>(
            listener: (context, state) {
              if (state is FirstProfileValidated) {
                BlocProvider.of<InitializationBloc>(context)
                    .add(OnBoardingFinished());
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new BottomNavBar(),
                  ),
                );
              }
              if (state is FirstNotProfileValidated) {
                setState(() {
                  hasFeedback = true;

                  _showFeedbackMessage();
                });
              }
              if (state is OnBoardingErrorState) {
                setState(() {
                  hasError = true;

                  _showErrorMessage(state.exception);
                });
              }
            },
            child: SingleChildScrollView(
              child: Padding(
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
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "TitilliumWeb",
                            fontWeight: FontWeight.w700,
                          ),
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
                          hint: Text(
                            "Platform",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "TitilliumWeb",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            )),
                        Visibility(
                            visible: hasFeedback,
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    "Profile has not been found",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            )),
                        AspectRatio(
                          aspectRatio: 20 / 3,
                          child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              //Add New Event
                              BlocProvider.of<OnBoardingBloc>(context).add(
                                FirstProfileAdded(
                                    profileId: textController.text,
                                    platformId: selectedPlatform),
                              );
                            },
                            child: Text("Send"),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }

  _buildAppBar() {
    return AppBar(
      leading: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pop(context);
          },
          child: Icon(Icons.close, color: Colors.white)),
      elevation: 0.0,
      backgroundColor: Theme.of(context).backgroundColor,
    );
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
