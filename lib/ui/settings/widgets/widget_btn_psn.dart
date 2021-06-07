import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetBtnPsn extends StatefulWidget {
  final Function(BuildContext context) onPressed;
  final bool selected;

  WidgetBtnPsn({this.onPressed, this.selected}) : super();

  @override
  _WidgetBtnPsnState createState() => _WidgetBtnPsnState();
}

class _WidgetBtnPsnState extends State<WidgetBtnPsn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: widget.selected ? Color(0xFFA0AEC5) : Color(0xFFF5F9FF),
              border: Border.all(
                width: 0.2,
                color: Color(0xFF3164CE),
              ),
              shape: BoxShape.rectangle),
          child: Center(
            child: Text(
              'Playstation',
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
