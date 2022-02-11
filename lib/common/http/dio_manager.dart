import 'package:dio/dio.dart';
import 'package:realworld_flutter/common/constant/app_keys.dart';
import 'package:realworld_flutter/common/util/storage.dart';

import 'interceptors.dart';

class DioManager {
  static late CancelToken defaultCancelToken = CancelToken();
  static late final Dio dio = Dio()..interceptors.addAll(interceptors);
  static late final Set<CancelToken> _cancelTokens = Set.identity();

  DioManager._private();

  static Future<bool> setBaseUrl(String url) async {
    cancelAll();
    final result = await Storage.setString(AppKeys.baseUrl, url);
    if (result) {
      dio.options.baseUrl = url;
    }
    return result;
  }

  static void addToken(CancelToken token) {
    _cancelTokens.add(token);
  }

  static cancelAll([dynamic reason]) {
    for (var token in _cancelTokens) {
      token.cancel(reason);
    }
    _cancelTokens.clear();
    defaultCancelToken = CancelToken();
  }
}
