import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StateView extends StatefulWidget {
  final Widget contentView;
  final Widget emptyView;
  final Widget loadingView;
  final Widget failView;
  final Widget? networkErrorView;
  final ViewStateEnum loadState;
  final bool enableRefresh;
  final bool enableLoadMore;
  final Widget? header;
  final Widget? footer;
  final RefreshController? controller;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;

  const StateView({
    super.key,
    required this.contentView,
    required this.emptyView,
    required this.loadingView,
    required this.failView,
    this.networkErrorView,
    required this.loadState,
    this.enableRefresh = true,
    this.enableLoadMore = true,
    this.header,
    this.footer,
    this.controller,
    this.onRefresh,
    this.onLoadMore,
  });

  @override
  StateViewState createState() => StateViewState();

  updateStatus(ViewStateEnum status) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateStatus(status);
    });
  }
}

class StateViewState extends State<StateView> {
  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (widget.loadState) {
      case ViewStateEnum.loading:
        child = widget.loadingView;
        break;
      case ViewStateEnum.success:
        child = widget.contentView;
        break;
      case ViewStateEnum.empty:
        child = widget.emptyView;
        break;
      case ViewStateEnum.fail:
        child = widget.failView;
        break;
      case ViewStateEnum.networkError:
        child = widget.networkErrorView ?? widget.failView;
        break;
    }
    if (widget.enableRefresh || widget.enableLoadMore) {
      return SmartRefresher(
        controller: widget.controller!,
        enablePullDown: widget.enableRefresh,
        enablePullUp: widget.enableLoadMore,
        header: widget.header,
        footer: widget.footer,
        onRefresh: widget.onRefresh,
        onLoading: widget.onLoadMore,
        child: child,
      );
    } else {
      return child;
    }
  }
}

enum ViewStateEnum {
  loading,
  success,
  empty,
  fail,
  networkError,
}
