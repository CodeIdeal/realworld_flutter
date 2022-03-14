import 'package:get/get.dart';
import 'package:realworld_flutter/pages/article_detail/binding.dart';
import 'package:realworld_flutter/pages/article_detail/view.dart';
import 'package:realworld_flutter/pages/article_post/binding.dart';
import 'package:realworld_flutter/pages/article_post/view.dart';
import 'package:realworld_flutter/pages/home/binding.dart';
import 'package:realworld_flutter/pages/home/view.dart';
import 'package:realworld_flutter/pages/login_or_register/binding.dart';
import 'package:realworld_flutter/pages/login_or_register/view.dart';
import 'package:realworld_flutter/pages/profile/binding.dart';
import 'package:realworld_flutter/pages/profile/view.dart';
import 'package:realworld_flutter/pages/profile_edit/binding.dart';
import 'package:realworld_flutter/pages/profile_edit/view.dart';
import 'package:realworld_flutter/pages/tag_article/binding.dart';
import 'package:realworld_flutter/pages/tag_article/view.dart';

abstract class Pages {
  static const home = '/home';
  static const loginOrRegister = '/loginOrRegister';
  static const profile = '/profile';
  static const editProfile = '/editProfile';
  static const articleDetail = '/articleDetail';
  static const newArticle = '/newArticle';
  static const tagArticles = '/tagArticles';

  static final List<GetPage> all = [
    GetPage(
      name: Pages.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Pages.loginOrRegister,
      page: () => const LoginOrRegisterPage(),
      binding: LoginOrRegisterBinding(),
    ),
    GetPage(
      name: Pages.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Pages.editProfile,
      page: () => ProfileEditPage(),
      binding: ProfileEditBinding(),
    ),
    GetPage(
      name: Pages.articleDetail,
      page: () => ArticleDetailPage(),
      binding: ArticleDetailBinding(),
    ),
    GetPage(
      name: Pages.newArticle,
      page: () => const ArticlePostPage(),
      binding: ArticlePostBinding(),
    ),
    GetPage(
      name: Pages.tagArticles,
      page: () => const TagArticlePage(),
      binding: TagArticleBinding(),
    ),
  ];
}
