import 'package:ow_api_app/util/exception/api_exception.dart';

abstract class ApiExceptionMapper {
  static String toErrorMessage(Object error) {
    if (error is ApiException) {
      if (error is ConnectionException) {
        return "Connection Error";
      } else if (error is ClientErrorException) {
        return "Client Error";
      } else if (error is ServerErrorException) {
        return "Server Error";
      } else if (error is EmptyResultException) {
        return "EmptyResultError";
      } else {
        return "Unknown Error";
      }
    } else {
      return "Unknown Error";
    }
  }
}
