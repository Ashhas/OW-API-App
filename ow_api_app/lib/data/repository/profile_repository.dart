import 'package:ow_api_app/data/model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ProfileRepository {
  Future<Profile> getProfileStats();
}

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Profile> getProfileStats() async {
    var response =
        await http.get("https://owapi.net/api/v3/u/Ashhas-2396/stats");

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Profile profileStats = Profile.fromJson(data);
      return profileStats;
    } else {
      throw Exception();
    }
  }
}
