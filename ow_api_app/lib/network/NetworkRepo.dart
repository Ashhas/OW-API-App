import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ow_api_app/data/UserProfile.dart';

import 'NetworkignResponse.dart';

/// Network Repo will do the networking for you
/// And will also take care of parsing
/// and exception handling
/// will simply return you data model or the exception message
class NetworkRepo {

  /// Instead of returning ApiResponseModel
  /// We have created a parent class called NetworkingResponse
  /// Which takes care of Successful and Failed response
  /// So we either send a successful or failed response wrapped in NetworkingResponse

  Future<NetworkingResponse> getLatestDataFromAPI() async {
    try {
      var response = await http.get(Uri.parse("https://ow-api.com/v3/stats/pc/Ashhas-2396/profile"));
      var parsedJson = await json.decode(response.body);
      UserProfile currentUser = UserProfile.fromJson(parsedJson);
      return NetworkingResponseData(currentUser);
    } catch (exception) {
      return NetworkingException(exception.toString());
    }
  }
}