import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/data/util/ApiException.dart';

abstract class ProfileRepository {
  Future<Profile> getProfileStats(String profileId);
}

class ProfileRepositoryImpl implements ProfileRepository {
  //"https://owapi.net/api/v3/u/Ashhas-2396/stats"
  //"https://owapi.net/api/v3/u/Axyos-21653/stats"
  //"https://owapi.net/api/v3/u/Venomflash-2745/stats"
  //"https://owapi.net/api/v3/u/mL8-2884/stats"

  @override
  Future<Profile> getProfileStats(String profileId) async {
    var response =
        await http.get("https://owapi.net/api/v3/u/" + profileId + "/stats");

    if (response.statusCode >= 200 && response.statusCode < 299) {
      var responseData = json.decode(response.body);
      Profile profileStats = Profile.fromJson(responseData);
      return profileStats;
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw ClientErrorException();
    } else if (response.statusCode >= 500 && response.statusCode < 600) {
      throw ServerErrorException();
    } else
      throw UnknownException();
  }
}
