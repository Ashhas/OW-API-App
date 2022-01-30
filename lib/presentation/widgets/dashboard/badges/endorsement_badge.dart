import 'package:flutter/material.dart';

class EndorsementBadge extends StatelessWidget {
  final int endorsementLevel;
  final String endorsementIcon;

  const EndorsementBadge({
    Key? key,
    required this.endorsementLevel,
    required this.endorsementIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          endorsementLevel.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
