import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/util/loading_dialog.dart';
import 'package:realworld_flutter/common/util/toast_utils.dart';
import 'package:realworld_flutter/model/entity/comment.dart';
import 'package:realworld_flutter/model/req/add_comment.dart';
import 'package:realworld_flutter/model/resp/article_resp.dart';
import 'package:realworld_flutter/model/resp/profile_resp.dart';
import 'package:realworld_flutter/service/rest_client.dart';

import 'state.dart';

class ArticleDetailLogic extends GetxController {
  final ArticleDetailState state = ArticleDetailState();

  var commentController = TextEditingController();

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
    commentsResp.comments.sort((a, b) => b.createdAt.compareTo(a.createdAt));
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

  void deleteComment(Comment comment) async {
    LoadingDialog.show();
    final article = state.article.value;
    if (article == null) return;
    try {
      await RestClient.client.deleteComment(article.slug, comment.id);
      state.comments.removeWhere((e) => e.id == comment.id);
    } catch (e) {
      ToastUtils.showError(e);
    } finally {
      LoadingDialog.hide();
    }
  }

  Future<void> postComment() async {
    if (commentController.value.text.isEmpty) {
      ToastUtils.show('Comment can\'t be blank');
      return;
    }
    final article = state.article.value;
    if (article == null) return;
    LoadingDialog.show();
    try {
      final commentResp = await RestClient.client.postComment(
        article.slug,
        AddComment(comment: NewComment(body: commentController.value.text)),
      );
      state.comments.insert(0, commentResp.comment);
      commentController.clear();
    } catch (e) {
      ToastUtils.showError(e);
    } finally {
      LoadingDialog.hide();
    }
  }
}
