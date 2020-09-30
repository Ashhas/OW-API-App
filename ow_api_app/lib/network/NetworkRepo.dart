import 'dart:convert';

import 'package:http/http.dart' as http;
import '../data/models/UserProfile.dart';
import 'NetworkingResponses.dart';

/// Network Repo will do the networking for you
/// And will also take care of parsing
/// and exception handling
/// will simply return you data model or the exception message
class NetworkRepo {

  Future<NetworkingResponse> getLatestDataFromAPI() async {
    try {
      var response = await http
          .get(Uri.parse("https://ow-api.com/v3/stats/pc/Ashhas-2396/profile"));
//          .get(Uri.parse("https://ow-api.com/v3/stats/pc/Ash-23871/profile"));
      var parsedJson = await json.decode(response.body);
      UserProfile currentUser = UserProfile.fromJson(parsedJson);
      return NetworkingResponseData(currentUser);
    } catch (exception) {
      return NetworkingException(exception.toString());
    }
  }
}
