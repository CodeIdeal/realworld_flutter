import 'package:get/get.dart';

import 'logic.dart';

class ArticlePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticlePostLogic());
  }
}
