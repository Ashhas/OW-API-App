import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/initialization/initialization_bloc.dart';
import 'package:ow_api_app/bloc/on_boarding/on_boarding_bloc.dart';
import 'package:ow_api_app/presentation/screens/bottom_navigation/bottom_navigation.dart';
import 'package:ow_api_app/presentation/widgets/common/network_notification/network_notification.dart';
import 'package:ow_api_app/presentation/widgets/common/profile_toggle_buttons.dart';
import 'package:ow_api_app/theme/spacing_const.dart';

class AddFirstProfileScreen extends StatefulWidget {
  const AddFirstProfileScreen({Key? key}) : super(key: key);

  @override
  _AddFirstProfileScreenState createState() => _AddFirstProfileScreenState();
}

class _AddFirstProfileScreenState extends State<AddFirstProfileScreen> {
  // Account Text field controller
  final TextEditingController accountIdController = TextEditingController();

  // Selected Platform from row
  String selectedPlatform = '';

  // Feedback Variables
  bool hasError = false;
  bool hasFeedback = false;
  bool allFilledIn = true;

  @override
  void dispose() {
    accountIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocConsumer<OnBoardingBloc, OnBoardingState>(
        listener: (context, onBoardingState) {
          if (onBoardingState is FirstProfileValidatedState) {
            BlocProvider.of<InitializationBloc>(context)
                .add(FinishOnBoarding());
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const BottomNavigation(),
              ),
            );
          }
          if (onBoardingState is FirstProfileNotValidatedState) {
            setState(() {
              hasFeedback = true;
            });
          }
          if (onBoardingState is OnBoardingErrorState) {
            setState(() {
              hasError = true;
            });
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const NetworkNotification(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingConst.paddingM,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    Text(
                      "Enter BattleTag",
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    const SizedBox(height: SpacingConst.paddingM),
                    TextField(
                      controller: accountIdController,
                      autofocus: true,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true,
                      ),
                    ),
                    Text(
                      "Please enter a valid BattleTag (Battletag#1234)",
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                    const SizedBox(height: SpacingConst.paddingXXL),
                    Text(
                      "Select a Platform",
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                    const SizedBox(height: SpacingConst.paddingM),
                    ProfileToggleButtons(
                      chosenPlatform: (value) => selectedPlatform = value,
                    ),
                    _feedbackMessageWidgets(),
                    const SizedBox(height: SpacingConst.paddingL),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 55,
                        child: ElevatedButton(
                          child: state is ValidatingFirstProfileState
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : const Text(
                                  'Send',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).highlightColor,
                          ),
                          onPressed: () {
                            if (accountIdController.text.isEmpty ||
                                selectedPlatform.isEmpty) {
                              setState(() {});
                            } else {
                              BlocProvider.of<OnBoardingBloc>(context).add(
                                AddFirstProfile(
                                    profileId: accountIdController.text,
                                    platformId: selectedPlatform),
                              );
                            }
                          },
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
