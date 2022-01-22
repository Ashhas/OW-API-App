import 'package:flutter/material.dart';

class DashboardLoading extends StatelessWidget {
  const DashboardLoading() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: CircularProgressIndicator(
          valueColor:
              new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          backgroundColor: Theme.of(context).shadowColor,
        ),
      ),
    );
  }
}
