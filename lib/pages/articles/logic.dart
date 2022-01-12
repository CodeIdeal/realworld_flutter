import 'package:realworld_flutter/common/http/dio_manager.dart';
import 'package:realworld_flutter/model/entity/article.dart';
import 'package:realworld_flutter/model/resp/article_resp.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/service/rest_client.dart';

import 'state.dart';

class ArticlesLogic extends GetxController {
  final ArticlesState state = ArticlesState();

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    final resp = await RestClient(DioManager.dio).getArticles();
    state.articles(resp.articles);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  toggleFav(Article article) async {
    ArticleResp resp;
    if(article.favorited){
      resp = await RestClient(DioManager.dio).favoriteArticle(article.slug);
    }else{
      resp = await RestClient(DioManager.dio).unfavoriteArticle(article.slug);
    }
    final newArticle = resp.article;
    final oldArticle = state.articles.firstWhere((p0) => p0.slug == newArticle.slug);
    oldArticle.favorited = newArticle.favorited;
    oldArticle.favoritesCount = newArticle.favoritesCount;
    oldArticle.updatedAt = newArticle.updatedAt;
    state.articles.refresh();
  }

}
