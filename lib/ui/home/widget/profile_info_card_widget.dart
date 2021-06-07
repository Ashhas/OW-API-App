import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ow_api_app/bloc/home/home_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          height: 140,
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
                          height: 95,
                          width: 95,
                          image: NetworkImage(state.profileStats.icon)),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              state.profileStats.name,
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            _endorsementIcon(
                              endorsementLevel: state.profileStats.endorsement,
                              endorsementIcon:
                                  state.profileStats.endorsementIcon,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _profileVisibilityCard(
                              isPrivateProfile: state.profileStats.private,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            _experienceCard(
                              profileLevel: state.profileStats.level,
                              prestigeLevel: state.profileStats.prestige,
                            ),
                          ],
                        ),
                      ],
                    )
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

  _endorsementIcon({int endorsementLevel, String endorsementIcon}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          endorsementLevel.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SvgPicture.network(
          endorsementIcon,
          color: Colors.white,
        ),
      ],
    );
  }

  _profileVisibilityCard({bool isPrivateProfile}) {
    return ElevatedButton(
      child: isPrivateProfile != true
          ? Row(
              children: [
                Text(
                  "Public",
                  style: Theme.of(context).primaryTextTheme.bodyText2,
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
    );
  }

  _experienceCard({int profileLevel, int prestigeLevel}) {
    int prestigeStarCount = prestigeLevel % 6;

    return Container(
      height: 24,
      width: 28 + (prestigeStarCount * 12).toDouble(),
      color: Color.fromRGBO(199, 206, 219, 0.5),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Text(
                profileLevel.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: prestigeStarCount,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                    size: 12,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
