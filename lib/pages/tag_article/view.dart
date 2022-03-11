import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/widget/app_bar.dart';
import 'package:realworld_flutter/common/widget/article_list.dart';

import 'logic.dart';

class TagArticlePage extends GetView<TagArticleLogic> {
  const TagArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(
        context: context,
        title: 'Tag:${Get.arguments}',
      ),
      body: ArticlesPage(
        tag: Get.arguments,
      ),
    );
  }
}
