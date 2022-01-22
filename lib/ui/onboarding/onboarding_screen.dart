import 'package:flutter/material.dart';
import 'package:ow_api_app/ui/onboarding/screens/add_first_profile_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.6,
                    width: MediaQuery.of(context).size.height * 0.4,
                    child: Image(
                      image: NetworkImage(
                        "https://i.shgcdn.com/a950797d-e478-49e5-9945-25c1fcf6ab5e/-/format/auto/-/preview/3000x3000/-/quality/lighter/",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text("OW-API",
                      style: GoogleFonts.roboto(
                          fontSize: 30.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "With OW-API you can see your Overwatch stats on the go, whenever you want!",
                        style: GoogleFonts.roboto(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                margin: EdgeInsets.only(bottom: 20.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 350, height: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftJoined,
                          child: AddFirstProfilePage(),
                          childCurrent: context.widget,
                        ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
