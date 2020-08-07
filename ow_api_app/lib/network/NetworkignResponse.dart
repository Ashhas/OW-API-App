import '../data/UserProfile.dart';

class NetworkingResponse {}

class NetworkingException extends NetworkingResponse {
  String message;
  NetworkingException(this.message);
}

class NetworkingResponseData extends NetworkingResponse {
  UserProfile currentUser;
  NetworkingResponseData(this.currentUser);
}