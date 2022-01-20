import 'package:get/get.dart';
import 'package:realworld_flutter/common/util/auth_manager.dart';

import '../pages.dart';
import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  @override
  void onReady() async {
    super.onReady();
    await fetchLogin();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout() async {
    await AuthManager.logout('manual logout');
    fetchLogin();
  }

  Future<void> fetchLogin() async {
    state.user.value = AuthManager.user;
    update(['rightMenu']);
  }

  void login() async {
    await Get.toNamed(Pages.loginOrRegister);
    fetchLogin();
  }
}
