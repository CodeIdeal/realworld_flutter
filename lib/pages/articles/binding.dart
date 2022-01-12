import 'package:get/get.dart';

import 'logic.dart';

class ArticlesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticlesLogic());
  }
}
