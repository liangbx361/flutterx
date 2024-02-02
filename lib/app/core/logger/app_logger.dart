import 'package:flutter/foundation.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutterx/app/data/enum/env_enum.dart';
import 'package:joyreels/app/data/enums/env_enum.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static AppLogger? _instance;

  static AppLogger get instance => _instance ??= AppLogger._internal();

  late Logger _logger;

  AppLogger._internal() {
    bool prod = FlavorConfig.instance.name == EnvEnum.prod.toString();
    _logger = Logger(
      filter: prod ? DevelopmentFilter() : ProductionFilter(),
    );
  }

  void i(String message, {String? tag}) {
    _logger.i(tag == null ? message : '$tag: $message');
  }

  void d(String message, {String? tag}) {
    _logger.d(tag == null ? message : '$tag: $message');
  }

  void e(String message, {String? tag}) {
    _logger.e(tag == null ? message : '$tag: $message');
  }

  void v(String message, {String? tag}) {
    _logger.v(tag == null ? message : '$tag: $message');
  }

  void w(String message, {String? tag}) {
    _logger.w(tag == null ? message : '$tag: $message');
  }

  bool debug() {
    // 检查当前环境是否为生产环境
    bool isProduction = FlavorConfig.instance.name == EnvEnum.prod.toString();

    // 检查当前是否为发布模式
    bool isReleaseMode = kReleaseMode;

    // 如果不是生产环境或者不是发布模式，则返回 true
    return !isProduction || !isReleaseMode;
  }
}
