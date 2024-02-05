import 'package:fluttertoast/fluttertoast.dart';
import 'package:joybox/app/core/logger/app_logger.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  bool _dark = false;
  late FToast _fToast;

  @override
  void onReady() {
    _fToast = FToast().init(Get.context!);
    super.onReady();
  }

  bool get dark => _dark;

  void setDark(bool value) {
    if (_dark == value) {
      AppLogger.instance.d("dark value{$_dark} is equals, drop it");
      return;
    }
    _dark = value;
    update();
  }

  FToast get fToast => _fToast;
}
