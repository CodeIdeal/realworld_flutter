import 'package:get/get.dart';
import 'package:realworld_flutter/common/util/auth_manager.dart';
import 'package:realworld_flutter/model/entity/profile.dart';

class ProfileState {
  var profile = Rxn<Profile>();

  bool get isCurrentUser =>
      profile.value?.username == AuthManager.user?.username;
}
