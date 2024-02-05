import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joybox/app/arch/state_view.dart';
import 'package:joybox/app/core/logger/app_logger.dart';
import 'package:joybox/app/data/errors/error_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class LoadDataController<T> extends GetxController {
  LoadDataConfig createLoadDataConfig();

  Future<void> onLoading();

  Future<T> loadData({String? nextPageToken});

  void onLoadSuccess(T data) {}

  void onLoadFail(e) {}

  Future<void> onRefresh();

  void onRefreshSuccess() {}

  Future<void> onLoadMore();

  void onRetry();

  LoadDataConfig get loadDataConfig;

  ViewStateEnum get viewState;

  RefreshController get refreshController;
}

class LoadDataConfig {
  final bool enableRefresh;
  final bool enableLoadMore;
  final Widget? header;
  final Widget? footer;

  LoadDataConfig({
    this.enableRefresh = false,
    this.enableLoadMore = false,
    this.header,
    this.footer,
  });
}

/*
 * 用于控制页面加载状态的控制器
 */
abstract class LoadStateControllerImpl<T> extends LoadDataController<T> with WidgetsBindingObserver {
  late final LoadDataConfig _loadDataConfig;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  ViewStateEnum _viewState = ViewStateEnum.loading;

  late T data;

  @override
  void onInit() {
    super.onInit();
    _loadDataConfig = createLoadDataConfig();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onReady() {
    onLoading();
    super.onReady();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  LoadDataConfig createLoadDataConfig() {
    return LoadDataConfig(
      enableRefresh: false,
      enableLoadMore: false,
    );
  }

  @override
  Future<void> onLoading() async {
    _viewState = ViewStateEnum.loading;
    update();

    try {
      T data = await loadData();
      AppLogger.instance.d("load success, data: $data");

      if (checkDataEmpty(data)) {
        _viewState = ViewStateEnum.empty;
      } else {
        _viewState = ViewStateEnum.success;
      }

      // 检测数据是否加载完毕
      if (_loadDataConfig.enableLoadMore && checkDataLoadEnd(data)) {
        _refreshController.loadNoData();
      }

      onLoadSuccess(data);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }
      if (ErrorHandler.isNetworkError(e)) {
        _viewState = ViewStateEnum.networkError;
      } else {
        _viewState = ViewStateEnum.fail;
      }
    } finally {
      update();
    }
  }

  @override
  Future<void> onRefresh() async {
    try {
      data = await loadData();
      _refreshController.refreshCompleted();
      if (checkDataEmpty(data)) {
        _viewState = ViewStateEnum.empty;
      } else {
        _viewState = ViewStateEnum.success;
      }

      // 检测数据是否加载完毕
      if (_loadDataConfig.enableLoadMore && checkDataLoadEnd(data)) {
        _refreshController.loadNoData();
      } else {
        _refreshController.loadComplete();
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }
      _refreshController.refreshFailed();
    } finally {
      _refreshController.refreshCompleted();
      update();
    }
  }

  @override
  Future<void> onLoadMore() async {
    if (data is! DataPage) {
      return;
    }

    try {
      DataPage dataPage = this.data as DataPage;
      DataPage moreDataPage = (await loadData(nextPageToken: dataPage.nextPageToken)) as DataPage;
      if (checkDataEmpty(data)) {
        _refreshController.loadNoData();
      } else {
        dataPage.datas.addAll((data as DataPage).datas);
        dataPage.nextPageToken = moreDataPage.nextPageToken;
        // 检测数据是否加载完毕
        if (checkDataLoadEnd(data)) {
          _refreshController.loadNoData();
        } else {
          _refreshController.loadComplete();
        }
      }
    } catch (e) {
      _refreshController.loadFailed();
    } finally {
      update();
    }
  }

  @override
  void onRetry() {
    onLoading();
  }

  bool checkDataEmpty(T data) {
    if (data == null) {
      return true;
    }
    if (data is List) {
      return data.isEmpty;
    }
    if (data is Map) {
      return data.isEmpty;
    }
    if (data is DataPage) {
      return data.datas.isEmpty;
    }
    return false;
  }

  bool checkDataLoadEnd(T data) {
    if (data is DataPage) {
      return data.nextPageToken == null;
    }
    return false;
  }

  @override
  LoadDataConfig get loadDataConfig => _loadDataConfig;

  @override
  ViewStateEnum get viewState => _viewState;

  @override
  RefreshController get refreshController => _refreshController;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}
}
