import 'package:get/get.dart';
import 'package:realworld_flutter/pages/home/binding.dart';
import 'package:realworld_flutter/pages/home/view.dart';
import 'package:realworld_flutter/pages/login_or_register/binding.dart';
import 'package:realworld_flutter/pages/login_or_register/view.dart';
import 'package:realworld_flutter/pages/profile/binding.dart';
import 'package:realworld_flutter/pages/profile/view.dart';
import 'package:realworld_flutter/pages/profile_edit/binding.dart';
import 'package:realworld_flutter/pages/profile_edit/view.dart';

abstract class Pages {
  static const home = '/home';
  static const loginOrRegister = '/loginOrRegister';
  static const profile = '/profile';
  static const editProfile = '/editProfile';

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
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Pages.editProfile,
      page: () => const ProfileEditPage(),
      binding: ProfileEditBinding(),
    ),
  ];
}
