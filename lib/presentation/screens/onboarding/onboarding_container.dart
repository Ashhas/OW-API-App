import 'package:flutter/material.dart';
import 'package:ow_api_app/presentation/screens/onboarding/screens/add_first_profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 100.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.6,
                    width: MediaQuery.of(context).size.height * 0.4,
                    child: const Image(
                      image: NetworkImage(
                        "https://i.shgcdn.com/a950797d-e478-49e5-9945-25c1fcf6ab5e/-/format/auto/-/preview/3000x3000/-/quality/lighter/",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text("OW-API",
                      style: GoogleFonts.roboto(
                          fontSize: 30.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                margin: const EdgeInsets.only(bottom: 20.0),
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 350, height: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AddFirstProfileScreen()),
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
