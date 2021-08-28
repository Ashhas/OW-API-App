import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EndorsementBadge extends StatelessWidget {
  final int endorsementLevel;
  final String endorsementIcon;

  const EndorsementBadge({this.endorsementLevel, this.endorsementIcon})
      : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          endorsementLevel.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
