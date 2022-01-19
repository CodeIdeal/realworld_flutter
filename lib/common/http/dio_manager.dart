import 'package:dio/dio.dart';

import 'interceptors.dart';

class DioManager {
  static late CancelToken defaultCancelToken = CancelToken();
  static late final Dio dio = Dio()..interceptors.addAll(interceptors);
  static late final Set<CancelToken> _cancelTokens = Set.identity();

  DioManager._private();

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
