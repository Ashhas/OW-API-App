import 'package:flutter/material.dart';
import 'package:ow_api_app/utils/exception/api_exception.dart';
import 'package:ow_api_app/utils/exception/api_exception_mapper.dart';

class DashboardError extends StatelessWidget {
  final Exception exception;

  const DashboardError({Key? key, required this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (exception is EmptyResultException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ApiExceptionMapper.toErrorMessage(exception),
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (exception is ConnectionException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ApiExceptionMapper.toErrorMessage(exception),
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (exception is ServerErrorException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ApiExceptionMapper.toErrorMessage(exception),
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (exception is ClientErrorException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ApiExceptionMapper.toErrorMessage(exception),
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (exception is UnknownException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ApiExceptionMapper.toErrorMessage(exception),
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
