import 'package:logger/logger.dart';

abstract class BaseLogger {
  void v(String message);
  void d(String message);
  void i(String message);
  void w(String message);
  void e(String message);
}

class EasyLogger implements BaseLogger {
  static final EasyLogger _instance = EasyLogger._internal();
  final Logger _logger = Logger();

  factory EasyLogger() => _instance;

  EasyLogger._internal();

  @override
  void i(message) {
    _logger.i(message);
  }

  @override
  void d(String message) {
    _logger.d(message);
  }

  @override
  void e(String message) {
    _logger.e(message);
  }

  @override
  void v(String message) {
    _logger.v(message);
  }

  @override
  void w(String message) {
    _logger.w(message);
  }
}
