import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:ow_api_app/ui/home/widget/rank_rating_widget.dart';

class ProfileInfoCard extends StatefulWidget {
  @override
  _ProfileInfoCardState createState() => _ProfileInfoCardState();
}

class _ProfileInfoCardState extends State<ProfileInfoCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is ProfileLoadedState) {
        return Padding(
            padding: EdgeInsets.only(top: 45, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                          height: 110,
                          width: 110,
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
                          height: 10,
                        ),
                        Text(
                          state.profileStats.name,
                          style: TextStyle(
                              fontFamily: "TitilliumWeb",
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RaisedButton(
                              child: state.profileStats.private != true
                                  ? Row(
                                      children: [
                                        Text(
                                          "Public",
                                          style: TextStyle(color: Colors.black),
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
                              color: Color.fromRGBO(246, 246, 133, 1.0),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
                RankRatingWidget(),
                SizedBox(height: 10),
              ],
            ));
      } else {
        return Container();
      }
    });
  }
}
