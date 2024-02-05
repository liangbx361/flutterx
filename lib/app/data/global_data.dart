import 'dart:ui';

import 'package:joybox/app/core/util/language_util.dart';
import 'package:joybox/app/values/app_config.dart';

class GlobalData {
  static GlobalData? _instance;

  static GlobalData get instance => _instance ??= GlobalData._internal();

  /// 定义应用全局需要的数据
  bool firstLaunch = false;
  String? userAgent;
  String? udid;
  String? platform;
  String? version;
  String? packageId;
  String? packageName;
  String? timeZone;
  String languageCode = AppConfig.defaultLanguageCode;
  late Locale locale;

  AppLink? appLink;

  double loadingLastProgress = 0;

  GlobalData._internal() {
    locale = LanguageUtil.toLocale(languageCode);
  }
}

class AppLink {
  // 定义业务需要的字段，通常为ID
  AppLink();
}
