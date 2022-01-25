import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/util/loading_dialog.dart';

import 'load_widgets.dart';

typedef PageServiceBuilder<T> = Future<List<T>?> Function(
    int offset, int limit);
typedef OnPageLoaded<T> = void Function(List<T> list);

const int showLoadingTime = 1000;

const String defaultError = '网络不给力';

/// 页面，列表加载通用组件
///
/// [child]需为lisview类型的滑动类组件
/// [pageService] 为列表类型的请求服务，[onPageLoaded]为每次每次分页请求完成时的回调，回返回本次加载的分页数据;
class LoadWrapper<T> extends StatefulWidget {
  final Widget child;
  final PageServiceBuilder<T> pageService;
  final LoadController? controller;
  final OnPageLoaded<T> onPageLoaded;
  final Widget? emptyWidget;
  final bool enablePullDown;
  final bool enablePullUp;
  final bool initLoading;
  final bool keepAlive;
  final int pageCount;

  const LoadWrapper({
    Key? key,
    required this.child,
    required this.pageService,
    required this.onPageLoaded,
    this.controller,
    this.emptyWidget,
    this.enablePullDown = true,
    this.enablePullUp = true,
    this.initLoading = true,
    this.keepAlive = false,
    this.pageCount = 10,
  }) : super(key: key);

  @override
  _LoadWrapper createState() =>
      // ignore: no_logic_in_create_state
      _LoadWrapper<T>(onPageLoaded: onPageLoaded, keepAlive: keepAlive);
}

class _LoadWrapper<T> extends State<LoadWrapper>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final Function(List<T>) onPageLoaded;
  final bool keepAlive;

  _LoadWrapper({required this.onPageLoaded, required this.keepAlive});

  late AnimationController _anicontroller, _scaleController;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  get wantKeepAlive => keepAlive;

  List<T>? _loadData;

  int _startIndex = 0;

  String? _loadError;

  bool _hideLoading = false;
  bool _loading = false;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((d) {
      _initData();
    });
    _initController();
    _bindController();
  }

  _bindController() {
    widget.controller?.initData = _initData;
    widget.controller?.loadmore = _loadMore;
  }

  _initController() {
    _anicontroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _scaleController =
        AnimationController(value: 0.0, vsync: this, upperBound: 1.0);
    refreshController.headerMode?.addListener(() {
      if (refreshController.headerStatus == RefreshStatus.idle) {
        _scaleController.value = 0.0;
        _anicontroller.reset();
      } else if (refreshController.headerStatus == RefreshStatus.refreshing) {
        _anicontroller.repeat();
      }
    });
  }

  _initData({bool initAll = true, bool showLoading = true}) async {
    if (_loading) {
      return;
    }
    _loading = true;
    refreshController.resetNoData();
    setState(() {
      _loadData = null;
    });
    if (showLoading && widget.initLoading) {
      Timer(const Duration(milliseconds: showLoadingTime), () {
        if (!_hideLoading) {
          _hideLoading = true;
          LoadingDialog.show();
        }
      });
    }
    try {
      List<T> response =
          await widget.pageService(_startIndex, widget.pageCount) as List<T>;
      setState(() {
        _loadData = response;
      });
      onPageLoaded.call(_loadData ?? []);
      refreshController.refreshCompleted();
      if ((_loadData?.length ?? 0) > 0 &&
          (_loadData?.length ?? 0) < widget.pageCount) {
        refreshController.loadNoData();
      }
      if (showLoading && _hideLoading) {
        LoadingDialog.hide();
      }
      _hideLoading = true;
      _loading = false;
      setState(() {
        _loadError = null;
      });
    } catch (e) {
      log('load error $e');
      _hideLoading = true;
      _loading = false;

      if (mounted) {
        setState(() {
          _loadError = (e as DioError).message;
        });
      }

      refreshController.refreshCompleted();
      if (showLoading) {
        LoadingDialog.hide();
      }
      return;
    }
  }

  _loadMore() async {
    _startIndex += _loadData?.length ?? 0;
    List<T>? response =
        await widget.pageService(_startIndex, widget.pageCount) as List<T>;
    if (response.isEmpty) {
      refreshController.loadNoData();
      return;
    } else {
      List<T> _data = (_loadData ?? []).map((e) => e).toList();
      _data.addAll(response);
      onPageLoaded.call(_data);
      _loadData = _data;
      refreshController.loadComplete();
    }
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
    _anicontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Builder(
      builder: (_) {
        if (_loadError != null) {
          return LoadError(
            text: _loadError!,
            callback: _initData,
          );
        }
        if (!widget.enablePullDown && !widget.enablePullUp) {
          return widget.child;
        }
        return _loadData != null && _loadData!.isEmpty
            ? widget.emptyWidget ?? const LoadEmpty()
            : SmartRefresher(
                enablePullDown: widget.enablePullDown,
                enablePullUp: widget.enablePullUp,
                header: CustomHeader(
                  refreshStyle: RefreshStyle.Behind,
                  onOffsetChange: (offset) {
                    if (refreshController.headerMode?.value !=
                        RefreshStatus.refreshing) {
                      _scaleController.value = offset / 80.0;
                    }
                  },
                  builder: (c, mode) {
                    Widget body = Container();
                    Widget loading = Container(
                      child: FadeTransition(
                        opacity: _scaleController,
                        child: ScaleTransition(
                          child: const RefreshLoadingView(),
                          scale: _scaleController,
                        ),
                      ),
                      alignment: Alignment.center,
                    );

                    if ([
                      RefreshStatus.refreshing,
                      RefreshStatus.canRefresh,
                      RefreshStatus.completed
                    ].contains(mode)) {
                      body = loading;
                    }
                    return body;
                  },
                ),
                footer: CustomFooter(
                  height: 80,
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = const Text("");
                    } else if (mode == LoadStatus.loading) {
                      body = const LoadingView();
                    } else if (mode == LoadStatus.failed) {
                      body = const Text("");
                    } else if (mode == LoadStatus.canLoading) {
                      body = const Text("");
                    } else {
                      body = const LoadFooter();
                    }
                    return Container(
                      color: AppColors.bg,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: refreshController,
                onRefresh: () async {
                  await _initData(showLoading: false);
                },
                onLoading: () async {
                  await _loadMore();
                },
                child: widget.child,
              );
      },
    );
  }
}

class LoadController {
  Function({bool initAll, bool showLoading})? initData;
  Function()? loadmore;

  void dispose() {
    initData = null;
    loadmore = null;
  }
}
