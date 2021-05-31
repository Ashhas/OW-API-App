import 'package:flutter/material.dart';
import 'package:ow_api_app/ui/onboarding/screens/add_first_profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 55),
              Row(
                children: [
                  Icon(Icons.pending_rounded),
                  Text("Ow-api",
                      style: GoogleFonts.roboto(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: 38),
              Text(
                "Ow-api shows you stats on the go whenever you want",
                style: GoogleFonts.roboto(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 40),
              Center(
                child: Image(
                  width: 300,
                  height: 200,
                  image: NetworkImage(
                    "https://i.shgcdn.com/a950797d-e478-49e5-9945-25c1fcf6ab5e/-/format/auto/-/preview/3000x3000/-/quality/lighter/",
                  ),
                ),
              ),
              SizedBox(height: 90),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 350, height: 50),
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
                    "Get Started",
                    style: GoogleFonts.roboto(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    onPrimary: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
