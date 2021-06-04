import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:ow_api_app/util/api_exception.dart';

class ProfileRepository {
  ProfileRepository();

  Future<Profile> getProfileStats(String profileId, String platformId) async {
    var response = await http.get("https://ow-api.com/v3/stats/" +
        platformId +
        "/" +
        profileId +
        "/complete");

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

  Future<bool> validateProfileId(String profileId, String platformId) async {
    var response = await http.get("https://ow-api.com/v3/stats/" +
        platformId +
        "/" +
        profileId +
        "/profile");

    if (response.statusCode >= 200 && response.statusCode < 299) {
      return true;
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw ClientErrorException();
    } else if (response.statusCode >= 500 && response.statusCode < 600) {
      throw ServerErrorException();
    } else
      throw UnknownException();
  }
}
