import 'package:realworld_flutter/pages/articles/binding.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/pages/login_or_register/binding.dart';
import 'package:realworld_flutter/pages/login_or_register/view.dart';

import 'articles/view.dart';

abstract class Pages {
  static const articles = '/articles';
  static const loginOrRegister = '/loginOrRegister';

  static final List<GetPage> all = [
    GetPage(
      name: Pages.articles,
      page: () => ArticlesPage(),
      binding: ArticlesBinding(),
    ),
    GetPage(
      name: Pages.loginOrRegister,
      page: () => LoginOrRegisterPage(),
      binding: LoginOrRegisterBinding(),
    ),
  ];
}
