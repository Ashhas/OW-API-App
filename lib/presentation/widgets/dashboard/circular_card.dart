import 'package:flutter/material.dart';

class CircularCard extends StatelessWidget {
  final Widget widgetColumn;

  const CircularCard({
    Key? key,
    required this.widgetColumn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: widgetColumn,
    );
  }
}
