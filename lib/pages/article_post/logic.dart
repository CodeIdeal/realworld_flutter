import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/util/loading_dialog.dart';
import 'package:realworld_flutter/common/util/toast_utils.dart';
import 'package:realworld_flutter/model/req/create_article.dart';
import 'package:realworld_flutter/model/resp/article_resp.dart';
import 'package:realworld_flutter/pages/pages.dart';
import 'package:realworld_flutter/service/rest_client.dart';

import 'state.dart';

class ArticlePostLogic extends GetxController {
  final ArticlePostState state = ArticlePostState();

  var titleController = TextEditingController();
  var descController = TextEditingController();
  var bodyController = TextEditingController();
  var tagController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    titleController.dispose();
    descController.dispose();
    bodyController.dispose();
    tagController.dispose();
  }

  void addTag(String tag) {
    if (tag.isEmpty) {
      ToastUtils.show('Tag can\'t be blank');
      return;
    }
    state.tags.add(tag);
    tagController.clear();
  }

  void deleteTag(int index) {
    state.tags.removeAt(index);
    state.tags.refresh();
  }

  Future<void> postArticle() async {
    final body = bodyController.value.text;
    final title = titleController.value.text;
    final desc = descController.value.text;
    if (title.isEmpty) {
      ToastUtils.show('Title can\'t be blank');
      return;
    } else if (body.isEmpty) {
      ToastUtils.show('Content can\'t be blank');
      return;
    }
    LoadingDialog.show();
    var result = false;
    ArticleResp? postResp;
    try {
      postResp = await RestClient.client.createArticle(CreateArticle(
        article: NewArticle(
          body: body,
          title: title,
          tagList: state.tags,
          description: desc,
        ),
      ));
      result = true;
    } catch (e, stackTrace) {
      log(stackTrace.toString());
      ToastUtils.showError(e);
    } finally {
      LoadingDialog.hide();
    }
    if (result && postResp != null) {
      Get.offNamed(Pages.articleDetail, arguments: postResp.article);
    }
  }
}
