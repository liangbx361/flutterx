import 'package:flutterx/app/modules/home/home_page.dart';
import 'package:flutterx/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static String splash = '/splash';
  static String home = '/home';

  static List<GetPage<dynamic>>? getAllPages() {
    return [
      GetPage(
        name: splash,
        page: () => const SplashPage(),
      ),
      GetPage(
        name: home,
        page: () => const HomePage(),
      ),
    ];
  }
}
