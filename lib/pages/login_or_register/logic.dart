import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_config.dart';
import 'package:realworld_flutter/common/constant/app_keys.dart';
import 'package:realworld_flutter/common/http/dio_manager.dart';
import 'package:realworld_flutter/common/util/auth_manager.dart';
import 'package:realworld_flutter/common/util/storage.dart';
import 'package:realworld_flutter/common/util/toast_utils.dart';
import 'package:realworld_flutter/model/req/login.dart';
import 'package:realworld_flutter/service/rest_client.dart';

import 'state.dart';

class LoginOrRegisterLogic extends GetxController {
  final LoginOrRegisterState state = LoginOrRegisterState();

  final passwordController = TextEditingController();

  final mailController = TextEditingController();

  final urlController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    urlController.text =
        Storage.getString(AppKeys.baseUrl) ?? AppConfig.baseUrl;
  }

  void login() async {
    try {
      final userResp = await RestClient.client.loginUser(Login(
        user: LoginUser(
          email: mailController.value.text,
          password: passwordController.value.text,
        ),
      ));
      AuthManager.login(userResp.user);
      Get.back(result: userResp.user);
    } catch (e) {
      ToastUtils.showError(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    mailController.dispose();
    urlController.dispose();
  }

  void setNewBaseUrl() async {
    final result = await DioManager.setBaseUrl(urlController.value.text);
    if (result) {
      Get.back();
    } else {
      ToastUtils.show('set base url fail');
    }
  }
}
