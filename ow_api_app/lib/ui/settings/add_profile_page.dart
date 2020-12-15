import 'package:flutter/material.dart';

class AddProfilePage extends StatefulWidget {
  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 30, 36, 1.0),
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
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
              color: Color.fromRGBO(24, 30, 36, 1.0),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      _entryField(),
                      SizedBox(
                        height: 20,
                      ),
                      AspectRatio(
                        aspectRatio: 20 / 3,
                        child: FlatButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Send",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          color: Colors.lightBlue,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _entryField() {
  return Container(
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
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true)),
        Text("Please enter a valid BattleTag (Battletag#1234)",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "TitilliumWeb",
              fontWeight: FontWeight.w500,
            )),
      ],
    ),
  );
}
