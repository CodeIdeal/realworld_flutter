import 'package:get/get.dart';

import 'logic.dart';

class ProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileEditLogic());
  }
}
