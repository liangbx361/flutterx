import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_colors.dart';
import '../values/app_themes.dart';

class AppAccentTextButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Widget? icon;
  final double? radius;
  final Function onPressed;

  const AppAccentTextButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    this.icon,
    this.radius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 40.r),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null) SizedBox(width: 5.w),
            Text(
              text,
              style: const MediumTextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
