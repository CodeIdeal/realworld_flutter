import 'package:get/get.dart';
import 'package:realworld_flutter/common/util/toast_utils.dart';
import 'package:realworld_flutter/model/resp/article_resp.dart';
import 'package:realworld_flutter/model/resp/profile_resp.dart';
import 'package:realworld_flutter/service/rest_client.dart';

import 'state.dart';

class ArticleDetailLogic extends GetxController {
  final ArticleDetailState state = ArticleDetailState();

  @override
  void onReady() {
    super.onReady();
    state.article.value = Get.arguments;
    fetchComments();
  }

  void fetchComments() async {
    final article = state.article.value;
    if (article == null) return;
    var commentsResp = await RestClient.client.getArticleComment(article.slug);
    state.comments.value = commentsResp.comments;
  }

  void toggleFav() async {
    final article = state.article.value;
    if (article == null) return;
    ArticleResp resp;
    try {
      if (article.favorited) {
        resp = await RestClient.client.unfavoriteArticle(article.slug);
      } else {
        resp = await RestClient.client.favoriteArticle(article.slug);
      }
      final newArticle = resp.article;
      state.article.value = newArticle;
    } catch (e) {
      ToastUtils.showError(e);
    }
  }

  void follow() async {
    final username = state.article.value?.author.username;
    if (username == null) return;
    ProfileResp profile;
    if (state.isFollowing) {
      profile = await RestClient.client.unfollowUser(username);
    } else {
      profile = await RestClient.client.followUser(username);
    }
    state.article.update((val) {
      val?.author = profile.profile;
    });
  }
}
