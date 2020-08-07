import 'package:dio/dio.dart' hide DioHttpHeaders;
import 'package:ow_api_app/data/UserProfile.dart';

class UserApiProvider {
  final String _endpoint = "pc/eu/Ashhas-2396/profile";
//  final String _endpoint = "pc/eu/cats-11481/profile";
//  final String _endpoint = "pc/eu/FDGod-2444/profile";
//  final String _endpoint = "pc/eu/fosuu-2866/profile";

  Dio _dio;

  UserApiProvider() {
    _dio = Dio();
    _dio.options.baseUrl = "https://ow-api.com/v1/stats/";
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;
  }

  Future<UserProfile> getUserProfile() async {
    Response response = await _dio.get(_endpoint);
    return UserProfile.fromJson(response.data);
  }
}
