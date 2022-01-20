import 'package:get/get.dart';
import 'package:realworld_flutter/model/entity/user.dart';

class HomeState {
  var user = Rxn<User>();

  bool get isLogin => user.value?.token.isNotEmpty == true;
}
