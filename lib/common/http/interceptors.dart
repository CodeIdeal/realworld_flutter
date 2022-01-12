import 'package:dio/dio.dart';
import 'package:realworld_flutter/common/http/dio_manager.dart';

class CancelInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    DioManager.addToken(options.cancelToken ??= DioManager.defaultCancelToken);
    handler.next(options);
  }
}