import 'dart:developer' as dev;

import 'package:get/get.dart';
import 'package:realworld_flutter/common/http/dio_manager.dart';
import 'package:realworld_flutter/common/util/auth_manager.dart';
import 'package:realworld_flutter/common/util/loading_dialog.dart';
import 'package:realworld_flutter/common/util/toast_utils.dart';
import 'package:realworld_flutter/model/entity/article.dart';
import 'package:realworld_flutter/model/resp/article_resp.dart';
import 'package:realworld_flutter/service/rest_client.dart';

import '../pages.dart';
import 'state.dart';

class ArticlesLogic extends GetxController {
  final ArticlesState state = ArticlesState();
  String? author;
  String? tag;
  String? favoriteBy;

  @override
  void onReady() async {
    super.onReady();
    try {
      author = Get.arguments['author'];
      tag = Get.arguments['tag'];
      favoriteBy = Get.arguments['favoritedBy'];
    } catch (e) {
      dev.log('get arguments error', error: e);
    }
    await fetchLogin();
    fetchArticles();
  }

  void fetchArticles() async {
    LoadingDialog.show();
    try {
      final resp = await RestClient(DioManager.dio).getArticles(
        author: author,
        tag: tag,
        favoriteBy: favoriteBy,
      );
      state.articles(resp.articles);
    } catch (e) {
      ToastUtils.showError(e);
    }finally{
      LoadingDialog.hide();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  toggleFav(Article article) async {
    ArticleResp resp;
    try {
      if (article.favorited) {
        resp = await RestClient(DioManager.dio).favoriteArticle(article.slug);
      } else {
        resp = await RestClient(DioManager.dio).unfavoriteArticle(article.slug);
      }
      final newArticle = resp.article;
      final oldArticle =
          state.articles.firstWhere((p0) => p0.slug == newArticle.slug);
      oldArticle.favorited = newArticle.favorited;
      oldArticle.favoritesCount = newArticle.favoritesCount;
      oldArticle.updatedAt = newArticle.updatedAt;
      state.articles.refresh();
    } catch (e) {
      ToastUtils.showError(e);
    }
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
    fetchArticles();
    fetchLogin();
  }
}
