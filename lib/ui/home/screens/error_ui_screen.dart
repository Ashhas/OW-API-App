import 'package:flutter/material.dart';
import 'package:ow_api_app/util/exception/api_exception.dart';
import 'package:ow_api_app/util/exception/api_exception_mapper.dart';

class ErrorUiScreen extends StatelessWidget {
  final Exception exception;

  ErrorUiScreen(this.exception);

  @override
  Widget build(BuildContext context) {
    if (exception is EmptyResultException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ApiExceptionMapper.toErrorMessage(exception),
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (exception is ConnectionException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ApiExceptionMapper.toErrorMessage(exception),
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (exception is ServerErrorException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ApiExceptionMapper.toErrorMessage(exception),
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (exception is ClientErrorException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ApiExceptionMapper.toErrorMessage(exception),
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (exception is UnknownException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ApiExceptionMapper.toErrorMessage(exception),
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else
      return Container();
  }
}
