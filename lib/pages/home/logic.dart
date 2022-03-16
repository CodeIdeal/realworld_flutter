import 'package:get/get.dart';
import 'package:realworld_flutter/common/util/auth_manager.dart';
import 'package:realworld_flutter/common/widget/load_wrapper.dart';

import '../pages.dart';
import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  final LoadController listController = LoadController();

  @override
  void onReady() async {
    super.onReady();
    await fetchLogin();
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

  void goProfile() async {
    await Get.toNamed(Pages.profile, arguments: state.user.value?.username);
    fetchLogin();
    listController.initData?.call();
  }
}
