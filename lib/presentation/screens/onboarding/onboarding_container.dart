import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ow_api_app/presentation/screens/onboarding/screens/add_first_profile_page.dart';
import 'package:ow_api_app/theme/spacing_const.dart';
import 'package:ow_api_app/utils/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: SpacingConst.paddingM,
              top: MediaQuery.of(context).size.height * 0.25,
              right: SpacingConst.paddingM,
              bottom: MediaQuery.of(context).size.height * 0.10,
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage(
                        'assets/overwatch-text-logo.png',
                      ),
                      width: MediaQuery.of(context).size.width * 0.52,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Text(
                      Constants.appName,
                      style: TextStyle(
                          fontSize: 30.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          Constants.onBoardingWelcomeLabel,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 55,
                    child: ElevatedButton(
                      child: const Text(
                        Constants.getStartedLabel,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).highlightColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddFirstProfileScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
