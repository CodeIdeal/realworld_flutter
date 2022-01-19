import 'package:get/get.dart';
import 'package:realworld_flutter/common/http/dio_manager.dart';
import 'package:realworld_flutter/common/util/storage.dart';
import 'package:realworld_flutter/common/util/toast_utils.dart';
import 'package:realworld_flutter/model/entity/user.dart';
import 'package:realworld_flutter/pages/pages.dart';

class AuthManager {
  static User? _loginUser;

  static init() async {
    _loginUser = Storage.getJsonObject<User>('user', (json) => User.fromJson(json));
  }

  static get isLogin => _loginUser != null && _loginUser!.token.isNotEmpty;

  static get token => _loginUser?.token;

  static get user => _loginUser;

  static login(User user) async {
    _loginUser = user;
    await Storage.setJsonObject('user', user);
  }

  static logout(String reason, [bool jumpToLogin = false]) async {
    _loginUser = null;
    await Storage.remove('user');
    DioManager.cancelAll(reason);
    ToastUtils.show(reason);
    if (jumpToLogin) {
      Get.toNamed(Pages.loginOrRegister);
    }
  }
}
