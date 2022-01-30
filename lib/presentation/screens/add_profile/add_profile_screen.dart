import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/add_profile/add_profile_bloc.dart';
import 'package:ow_api_app/bloc/more/more_bloc.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/network_notification.dart';

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({Key? key}) : super(key: key);

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
  late List<FocusNode> focusToggle;

  //Platform Variables
  late String selectedPlatform;
  bool pcBtnSelected = false;
  bool psnBtnSelected = false;
  bool xblBtnSelected = false;
  bool switchBtnSelected = false;

  //Feedback Variables
  bool hasError = false;
  bool hasFeedback = false;
  bool allFilledIn = true;

  //Network Variables
  late ConnectivityResult netResult;

  @override
  void initState() {
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
      body: BlocConsumer<AddProfileBloc, AddProfileState>(
        listener: (context, state) async {
          if (state is ProfileValidated) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const NetworkNotification(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Enter BattleTag",
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: accountIdController,
                      autofocus: true,
                      obscureText: false,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true),
                    ),
                    Text("Please enter a valid BattleTag (Battletag#1234)",
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Select a Platform",
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    const SizedBox(
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
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
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
                          child: SizedBox(
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
                          child: SizedBox(
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
                          child: SizedBox(
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
                    _feedbackMessageWidgets(),
                    const SizedBox(height: 20),
                    AspectRatio(
                      aspectRatio: 20 / 3,
                      child: ElevatedButton(
                        onPressed: () {
                          if (accountIdController.text.isEmpty ||
                              selectedPlatform == null) {
                            setState(() {});
                          } else {
                            FocusScope.of(context).requestFocus(FocusNode());

                            BlocProvider.of<AddProfileBloc>(context).add(
                              AddNewProfile(
                                  profileId: accountIdController.text,
                                  platformId: selectedPlatform),
                            );
                          }
                        },
                        child: state is ValidatingProfile
                            ? const Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const Text(
                                "Send",
                                style: TextStyle(color: Colors.white),
                              ),
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).accentColor,
                          onPrimary: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          );
        },
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
          child: const Icon(Icons.close, color: Colors.black)),
      elevation: 0.0,
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  _feedbackMessageWidgets() {
    return Column(
      children: [
        Visibility(
          visible: !allFilledIn,
          child: Column(
            children: [
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
          visible: hasFeedback,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Profile has not been found",
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
