import 'package:flutter/material.dart';
import 'package:ow_api_app/presentation/screens/add_profile/add_profile_screen.dart';
import 'package:ow_api_app/utils/constants.dart';

class AddAccountTile extends StatelessWidget {
  const AddAccountTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProfileScreen()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.add, color: Colors.white),
            Text(Constants.addAccountLabel,
                style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
