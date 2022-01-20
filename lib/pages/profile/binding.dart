import 'package:get/get.dart';

import 'logic.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileLogic());
  }
}
