import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_keys.dart';
import 'package:realworld_flutter/common/http/dio_manager.dart';
import 'package:realworld_flutter/common/util/storage.dart';
import 'package:realworld_flutter/common/util/toast_utils.dart';
import 'package:realworld_flutter/model/entity/user.dart';
import 'package:realworld_flutter/pages/pages.dart';

class AuthManager {
  static User? _loginUser;

  static init() async {
    _loginUser = Storage.getJsonObject<User>(
        AppKeys.loginUser, (json) => User.fromJson(json));
  }

  static get isLogin => _loginUser != null && _loginUser!.token.isNotEmpty;

  static get token => _loginUser?.token;

  static User? get user => _loginUser;

  static String? get userName => _loginUser?.username;

  static String? get avatar => _loginUser?.image;

  static login(User user) async {
    _loginUser = user;
    await Storage.setJsonObject(AppKeys.loginUser, user);
  }

  static logout(String reason, [bool jumpToHome = false]) async {
    _loginUser = null;
    await Storage.remove(AppKeys.loginUser);
    DioManager.cancelAll(reason);
    ToastUtils.show(reason);
    if (jumpToHome) {
      Get.until((route) => route.settings.name == Pages.home);
    }
  }
}
