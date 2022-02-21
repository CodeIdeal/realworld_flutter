import 'package:get/get.dart';
import 'package:realworld_flutter/model/entity/article.dart';
import 'package:realworld_flutter/model/entity/comment.dart';

class ArticleDetailState {
  var article = Rxn<Article>();
  var comments = RxList<Comment>();

  String? get articleTitle => article.value?.title;

  String? get body => article.value?.body;

  bool get isFollowing => article.value?.author.following == true;

  bool get isFavorite => article.value?.favorited == true;

  int get favoriteCount => article.value?.favoritesCount ?? 0;
}
