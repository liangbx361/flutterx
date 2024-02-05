import 'dart:io';

import 'package:dio/dio.dart';

class ErrorHandler {
  static bool isNetworkError(dynamic e) {
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown && e.error is IOException) {
        return true;
      }
    }

    return false;
  }
}
