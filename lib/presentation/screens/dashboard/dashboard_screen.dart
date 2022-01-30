import 'package:flutter/material.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/info_card.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/network_notification.dart';
import 'package:ow_api_app/presentation/widgets/dashboard/statistics_card.dart';

class DashboardScreen extends StatefulWidget {
  const  DashboardScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: const [
                      NetworkNotification(),
                      InfoCard(),
                      StatisticsCard(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
