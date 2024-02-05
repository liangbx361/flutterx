import 'package:joybox/app/data/enum/language_enum.dart';

class AppConfig {
  AppConfig._();

  static const String appName = 'JoyBox';

  static const String termsOfServiceUrl = '';

  static const String privacyPolicyUrl = '';

  static const String contactUsUrl = '';

  static const String faqUrl = '';

  static const String fpUrl = "assets/web/fp.html";

  static const int pageSize = 20;

  static const String tiktokClientKey = "awzj8u0vqbg8xh2h";

  static const String afDevKey = "mG3uMvHQ3jJoSbcWKrBfce";

  static const String appStoreAppId = "6465895541";

  static const String appleTermsOfService = "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/";

  static const String defaultProductId = "joyreels.default.0099";

  static const List<String> supportedLanguageCode = [
    LanguageEnum.englishCode,
    LanguageEnum.simpleChineseCode,
    LanguageEnum.thaiCode,
    LanguageEnum.indonesiaCode
  ];

  static const String defaultLanguageCode = LanguageEnum.englishCode;
}
