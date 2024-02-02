import 'dart:ui';

import 'package:flutterx/app/core/util/language_util.dart';

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
  String languageCode = "en";
  late Locale locale;

  AppLink? appLink;

  GlobalData._internal() {
    locale = LanguageUtil.toLocale(languageCode);
  }
}

class AppLink {
  // 定义业务需要的字段，通常为ID
  AppLink();
}
