import 'package:realworld_flutter/pages/articles/binding.dart';
import 'package:get/get.dart';

import 'articles/view.dart';

abstract class Pages {
  static const articles = '/articles';

  static final List<GetPage> all = [
    GetPage(
      name: Pages.articles,
      page: () => ArticlesPage(),
      binding: ArticlesBinding(),
    ),
  ];
}
