import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterx/app/app_controller.dart';
import 'package:flutterx/app/data/global_data.dart';
import 'package:flutterx/app/global_widgets/system_ui_theme.dart';
import 'package:flutterx/app/modules/splash/splash_page.dart';
import 'package:flutterx/app/routes/app_routes.dart';
import 'package:flutterx/app/values/app_config.dart';
import 'package:flutterx/app/values/app_themes.dart';
import 'package:flutterx/generated/locales.g.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 指定设计稿中的尺寸
      designSize: const Size(1920, 1080),
      builder: (context, child) {
        return GetBuilder(
          init: AppController(),
          builder: (controller) {
            return SystemUiTheme(
              dark: controller.dark,
              child: GetMaterialApp(
                title: AppConfig.appName,
                theme: AppThemes.createLightTheme(),
                darkTheme: AppThemes.createDarkTheme(),
                translationsKeys: AppTranslation.translations,
                locale: GlobalData.instance.locale,
                fallbackLocale: const Locale('en'),
                initialRoute: '/',
                getPages: AppRoutes.getAllPages(),
                defaultTransition: Transition.cupertino,
                transitionDuration: const Duration(milliseconds: 550),
                builder: FToastBuilder(),
                home: const SplashPage(),
              ),
            );
          },
        );
      },
    );
  }
}
