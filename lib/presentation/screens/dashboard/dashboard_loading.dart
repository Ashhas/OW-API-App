import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardLoading extends StatelessWidget {
  const DashboardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            backgroundColor: Theme.of(context).shadowColor,
          ),
        ),
      ),
    );
  }
}
