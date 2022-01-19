import 'package:get/get.dart';
import 'package:realworld_flutter/model/entity/article.dart';
import 'package:realworld_flutter/model/entity/user.dart';

class ArticlesState {
  var articles = <Article>[].obs;
  var user = Rxn<User>();

  bool get isLogin => user.value?.token.isNotEmpty == true;
}
