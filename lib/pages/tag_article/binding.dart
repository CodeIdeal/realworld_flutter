import 'package:get/get.dart';

import 'logic.dart';

class TagArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TagArticleLogic());
  }
}
