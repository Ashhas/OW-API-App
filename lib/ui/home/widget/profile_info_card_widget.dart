import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';

class ProfileInfoCard extends StatefulWidget {
  @override
  _ProfileInfoCardState createState() => _ProfileInfoCardState();
}

class _ProfileInfoCardState extends State<ProfileInfoCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is ProfileLoadedState) {
        return Container(
          height: 150,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                          height: 105,
                          width: 105,
                          image: NetworkImage(state.profileStats.icon)),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Container(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          state.profileStats.name,
                          style: Theme.of(context).primaryTextTheme.headline3,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: state.profileStats.private != true
                                  ? Row(
                                      children: [
                                        Text(
                                          "Public",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline6,
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: Colors.black,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          "Private",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.lock,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).hintColor,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
