import 'package:realworld_flutter/common/util/auth_manager.dart';
import 'package:realworld_flutter/common/util/storage.dart';

class InitUtils{
  static Future<void> init() async {
    await Storage.init();
    await AuthManager.init();
  }
}