import 'package:get/get.dart';

import 'logic.dart';

class LoginOrRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginOrRegisterLogic());
  }
}
