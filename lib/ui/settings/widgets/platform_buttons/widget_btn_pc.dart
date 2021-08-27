import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetBtnPc extends StatefulWidget {
  final Function(BuildContext context) onPressed;
  final bool selected;

  WidgetBtnPc({this.onPressed, this.selected}) : super();

  @override
  _WidgetBtnPcState createState() => _WidgetBtnPcState();
}

class _WidgetBtnPcState extends State<WidgetBtnPc> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFFF5F9FF),
              border: Border.all(
                width: 0.2,
                color: Color(0xFF3164CE),
              ),
              shape: BoxShape.rectangle),
          child: Center(
            child: Text(
              'Battle Net',
            ),
          ),
        ),
        onTap: onTapFunction(context) as void Function(),
      ),
    );
  }

  Function onTapFunction(BuildContext context) => widget.onPressed != null
      ? () {
          if (widget.onPressed != null) {
            widget.onPressed.call(context);
          }
        }
      : null;
}
