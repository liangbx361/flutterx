import 'package:flutterx/app/core/logger/app_logger.dart';
import 'package:flutterx/app/tracker/app_tracker.dart';
import 'package:get/get.dart';

class PageTrackingMiddleware extends GetMiddleware {
  /// 页面被调用时触发
  @override
  GetPage? onPageCalled(GetPage? page) {
    AppLogger.instance.d("onPageCalled page=${page?.name}");
    if (page == null) {
      return page;
    }

    String eventName = "open_page${toPageName(page.name)}";
    AppTracker.instance.onEvent(eventName);

    return page;
  }

  /// 页面被展示时触发

  String toPageName(String routeName) {
    return routeName.replaceAll("/", "_").replaceAll("-", "_");
  }
}
