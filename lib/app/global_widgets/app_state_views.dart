import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../generated/locales.g.dart';
import '../data/global_data.dart';
import '../values/app_images.dart';
import '../values/app_themes.dart';
import 'app_button.dart';
import 'image_view.dart';

class AppLoadingStateView extends StatefulWidget {
  final bool fromLastProgress;

  const AppLoadingStateView({
    super.key,
    this.fromLastProgress = false,
  });

  @override
  State<StatefulWidget> createState() {
    return LoadingState();
  }
}

class LoadingState extends State<AppLoadingStateView> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool _isShowing = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.addListener(() {
      GlobalData.instance.loadingLastProgress = _animationController.value;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fromLastProgress) {
      return Offstage(
        offstage: !_isShowing,
        child: Center(
          child: _buildLottieAnimation(),
        ),
      );
    } else {
      return Center(
        child: _buildLottieAnimation(),
      );
    }
  }

  Widget _buildLottieAnimation() {
    return Lottie.asset(
      AppImages.commonLoadingAnm,
      width: 100.w,
      height: 100.w,
      fit: BoxFit.cover,
      controller: _animationController,
      onLoaded: (composition) {
        _animationController.duration = composition.duration;
        if (widget.fromLastProgress) {
          _animationController.value = GlobalData.instance.loadingLastProgress;
          Future.delayed(const Duration(milliseconds: 16), () {
            _isShowing = true;
            setState(() {});
          });
        }
        _animationController.repeat();
      },
    );
  }
}

/// 通用空数据视图
class AppEmptyStateView extends BaseExceptionStateView {
  AppEmptyStateView({
    super.key,
    Function? onRefresh,
  }) : super(
          hintImagePath: AppImages.commonEmptyState.tr,
          hintText: LocaleKeys.empty.tr,
          actionButtonText: LocaleKeys.refresh.tr,
          action: onRefresh,
          dark: false,
        );
}

/// 通用网络错误视图
class AppNetworkErrorStateView extends BaseExceptionStateView {
  AppNetworkErrorStateView({
    super.key,
    Function? onRetry,
  }) : super(
          hintImagePath: AppImages.commonNetworkErrorState.tr,
          hintText: LocaleKeys.networkError.tr,
          actionButtonText: LocaleKeys.tryAgain.tr,
          action: onRetry,
          dark: false,
        );
}

/// 通用加载失败视图
class AppFailStateView extends BaseExceptionStateView {
  AppFailStateView({
    super.key,
    Function? onRefresh,
  }) : super(
          hintImagePath: AppImages.commonFailState.tr,
          hintText: LocaleKeys.loadFailed.tr,
          actionButtonText: LocaleKeys.refresh.tr,
          action: onRefresh,
          dark: false,
        );
}

abstract class BaseExceptionStateView extends StatelessWidget {
  final String hintImagePath;
  final String hintText;
  final String? actionButtonText;
  final Function? action;
  final bool dark;

  const BaseExceptionStateView({
    required this.hintImagePath,
    required this.hintText,
    this.actionButtonText,
    this.action,
    this.dark = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LocalImageView(
          imagePath: hintImagePath,
          width: 220.w,
          height: 170.w,
        ),
        Container(
          padding: EdgeInsets.only(top: 20.h, left: 35.w, right: 35.w),
          child: Text(
            hintText,
            textAlign: TextAlign.center,
            style: RegularTextStyle(
              color: dark ? const Color(0xFF808080) : const Color(0xFF898989),
              fontSize: 14,
            ),
          ),
        ),
        if (actionButtonText != null)
          // 重试按钮
          Padding(
            padding: EdgeInsets.only(top: 50.w),
            child: AppAccentTextButton(
              width: 305.w,
              height: 40.w,
              text: actionButtonText!,
              onPressed: () {
                action?.call();
              },
            ),
          )
        else
          Container(
            padding: EdgeInsets.only(top: 50.w),
            width: 305.w,
            height: 40.w,
          ),
        SizedBox(
          height: 70.w,
        ),
      ],
    );
  }
}
