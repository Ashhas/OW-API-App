import 'package:flutter/material.dart';

class ProfileToggleButtons extends StatefulWidget {
  final ValueChanged<String> chosenPlatform;

  const ProfileToggleButtons({
    Key? key,
    required this.chosenPlatform,
  }) : super(key: key);

  @override
  _ProfileToggleButtonsState createState() => _ProfileToggleButtonsState();
}

class _ProfileToggleButtonsState extends State<ProfileToggleButtons> {
  //ToggleButtons Values
  List<bool> isSelected = [false, false, false, false];
  List<String> buttonValue = ["pc", "psn", "xbl", "nintendo-switch"];
  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  FocusNode focusNodeButton3 = FocusNode();
  FocusNode focusNodeButton4 = FocusNode();
  late List<FocusNode> focusToggle;

  //Platform Variables
  bool pcBtnSelected = false;
  bool psnBtnSelected = false;
  bool xblBtnSelected = false;
  bool switchBtnSelected = false;

  @override
  void initState() {
    super.initState();

    focusToggle = [
      focusNodeButton1,
      focusNodeButton2,
      focusNodeButton3,
      focusNodeButton4,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        selectedColor: Colors.white,
        borderColor: Colors.white,
        fillColor: Colors.white,
        borderWidth: 5,
        selectedBorderColor: Theme.of(context).primaryColor,
        renderBorder: true,
        disabledColor: Colors.white,
        disabledBorderColor: Colors.white,
        focusNodes: focusToggle,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 35,
              width: 35,
              child: Image(
                image: AssetImage('assets/platformIcon/battle_net_icon.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 35,
              width: 35,
              child: Image(
                image:
                    AssetImage('assets/platformIcon/nintendo_switch_icon.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 35,
              width: 35,
              child: Image(
                image: AssetImage('assets/platformIcon/playstation_icon.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 35,
              width: 35,
              child: Image(
                image: AssetImage('assets/platformIcon/xbox_icon.png'),
              ),
            ),
          ),
        ],
        isSelected: isSelected,
        onPressed: (int index) {
          setState(
            () {
              for (int buttonIndex = 0;
                  buttonIndex < isSelected.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  //Show Selected
                  isSelected[buttonIndex] = !isSelected[buttonIndex];

                  //Set Value
                  widget.chosenPlatform(buttonValue[buttonIndex]);
                } else {
                  isSelected[buttonIndex] = false;
                }
              }
            },
          );
        },
      ),
    );
  }
}
