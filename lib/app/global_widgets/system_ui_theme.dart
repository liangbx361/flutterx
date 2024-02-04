import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterx/app/values/app_colors.dart';

class SystemUiTheme extends StatelessWidget {
  final bool dark;
  final Widget child;

  const SystemUiTheme({
    super.key,
    required this.dark,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Brightness getBrightness(bool isDark, bool isIOS) {
      if (isIOS) {
        return isDark ? Brightness.dark : Brightness.light;
      } else {
        return isDark ? Brightness.light : Brightness.dark;
      }
    }

    AnnotatedRegion<SystemUiOverlayStyle> buildAnnotatedRegion(bool dark, Widget child) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: getBrightness(dark, Platform.isIOS),
          statusBarBrightness: getBrightness(dark, Platform.isIOS),
          systemNavigationBarColor: dark ? AppColors.backgroundColorDark : AppColors.backgroundColor,
          systemNavigationBarDividerColor: dark ? AppColors.backgroundColorDark : AppColors.backgroundColor,
          systemNavigationBarIconBrightness: getBrightness(dark, Platform.isIOS),
        ),
        child: child,
      );
    }

    return buildAnnotatedRegion(dark, child);
  }
}
