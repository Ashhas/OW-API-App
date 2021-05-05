import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/on_boarding/on_boarding_bloc.dart';
import 'package:ow_api_app/ui/onboarding/screens/add_first_profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 100.0),
                child: Image(
                  width: 300,
                  height: 300,
                  image: NetworkImage(
                    "https://i.shgcdn.com/a950797d-e478-49e5-9945-25c1fcf6ab5e/-/format/auto/-/preview/3000x3000/-/quality/lighter/",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15, right: 40, left: 40),
                child: Text(
                  "This is an unofficial app for getting your Overwatch career profile on your phone!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 100, right: 40, left: 40),
                child: Text(
                  "To get started you need to enter your Battle.net ID. ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 250, height: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      pushNewScreen(
                        context,
                        screen: AddFirstProfilePage(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Text(
                      "Next",
                      style: Theme.of(context).primaryTextTheme.button,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
