import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:joybox/app/app_controller.dart';
import 'package:joybox/app/values/app_themes.dart';
import 'package:get/get.dart';

class AppToast {
  static void showSuccess(String message) {
    AppController controller = Get.find<AppController>();
    controller.fToast.showToast(
      child: AppToastView(
        message: message,
        backgroundColor: const Color(0xFF333333),
        textColor: Colors.white,
      ),
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
  }

  static void showError(String message) {
    showSuccess(message);
  }

  static void showWarning(String message) {
    showSuccess(message);
  }
}

class AppToastView extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;

  const AppToastView({
    super.key,
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null)
            const SizedBox(
              width: 4.0,
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 0.6.sw,
            ),
            child: Text(
              message,
              style: RegularTextStyle(
                color: textColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
