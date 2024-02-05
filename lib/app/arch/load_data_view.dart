import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:joybox/app/app_controller.dart';
import 'package:joybox/app/arch/load_data_controller.dart';
import 'package:joybox/app/arch/state_view.dart';
import 'package:joybox/app/global_widgets/app_state_views.dart';
import 'package:joybox/app/values/app_colors.dart';

abstract class LoadDataView<T extends LoadDataController> extends StatefulWidget {
  const LoadDataView({
    super.key,
  });

  Widget buildContentView(BuildContext context, T controller);

  Widget buildHeader(BuildContext context, T controller);

  T createController();

  @override
  LoadStatePageState createState() => LoadStatePageState();

  String? createControllerTag() {
    return null;
  }

  bool addSafeArea() {
    return false;
  }

  bool wantKeepAlive() {
    return false;
  }

  bool dark() {
    return Get.find<AppController>().dark;
  }

  Widget build(BuildContext context) {
    return GetBuilder<T>(
      init: createController(),
      tag: createControllerTag(),
      builder: ((controller) {
        Widget body = Column(
          children: [
            buildHeader(context, controller),
            Expanded(
              child: buildBody(context, controller),
            ),
          ],
        );
        if (addSafeArea()) {
          body = SafeArea(child: body);
        }
        return Scaffold(
          backgroundColor: dark() ? AppColors.backgroundColorDark : AppColors.backgroundColor,
          body: body,
        );
      }),
    );
  }

  Widget buildBody(BuildContext context, T controller) {
    return StateView(
      contentView: controller == ViewStateEnum.success ? buildContentView(context, controller) : Container(),
      emptyView: buildEmptyView(context, controller),
      loadingView: buildLoadingView(context, controller),
      failView: buildFailView(context, controller),
      networkErrorView: buildNetworkErrorView(context, controller),
      loadState: controller.viewState,
      enableRefresh: controller.loadDataConfig.enableRefresh,
      enableLoadMore: controller.loadDataConfig.enableLoadMore,
      header: controller.loadDataConfig.header,
      footer: controller.loadDataConfig.footer,
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      onLoadMore: controller.onLoadMore,
    );
  }

  Widget buildLoadingView(BuildContext context, T controller) {
    return const AppLoadingStateView();
  }

  Widget buildEmptyView(BuildContext context, T controller) {
    return AppEmptyStateView();
  }

  Widget buildFailView(BuildContext context, T controller) {
    return AppFailStateView(onRefresh: () => {controller.onRefresh()});
  }

  Widget buildNetworkErrorView(BuildContext context, T controller) {
    return AppNetworkErrorStateView(onRetry: () => {controller.onRetry()});
  }
}

class LoadStatePageState<T extends LoadDataController> extends State<LoadDataView>
    with AutomaticKeepAliveClientMixin<LoadDataView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  bool get wantKeepAlive => widget.wantKeepAlive();
}
