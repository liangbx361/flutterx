import 'package:flutter/material.dart';
import 'package:joybox/app/data/enum/language_enum.dart';

class LanguageUtil {
  static String getDeviceLanguageCode() {
    Locale locale = WidgetsBinding.instance.platformDispatcher.locale;
    String languageTag = locale.toLanguageTag();

    if (languageTag.startsWith("zh")) {
      if (languageTag.contains("TW") ||
          languageTag.contains("HK") ||
          languageTag.contains("MO") ||
          languageTag.contains("Hant")) {
        return LanguageEnum.traditionalChineseCode;
      } else {
        return LanguageEnum.simpleChineseCode;
      }
    } else {
      return locale.languageCode;
    }
  }

  static Locale toLocale(String languageCode) {
    if (languageCode == LanguageEnum.simpleChineseCode) {
      return const Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN');
    } else if (languageCode == LanguageEnum.traditionalChineseCode) {
      return const Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW');
    } else {
      return Locale.fromSubtags(languageCode: languageCode);
    }
  }
}
