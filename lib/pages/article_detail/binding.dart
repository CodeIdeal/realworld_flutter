import 'package:get/get.dart';

import 'logic.dart';

class ArticleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleDetailLogic(), tag: Get.arguments.toString());
  }
}
