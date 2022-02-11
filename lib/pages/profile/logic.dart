import 'dart:developer';

import 'package:get/get.dart';
import 'package:realworld_flutter/model/resp/profile_resp.dart';
import 'package:realworld_flutter/service/rest_client.dart';

import 'state.dart';

class ProfileLogic extends GetxController {
  final ProfileState state = ProfileState();
  static const tabs = ['My Articles', 'Favorited Articles'];

  @override
  void onReady() {
    super.onReady();
    fetchUserInfo();
  }

  void fetchUserInfo() async {
    try {
      final userName = Get.arguments;
      ProfileResp profileResp = await RestClient.client.getProfile(userName);
      state.profile.value = profileResp.profile;
    } catch (e) {
      log(e.toString());
    }
  }

  void follow() async {
    final username =  state.profile.value?.username;
    if(username == null) return;
    ProfileResp profile;
    if(state.profile.value?.following == true){
      profile = await RestClient.client.unfollowUser(username);
    }else{
      profile = await RestClient.client.followUser(username);
    }
    state.profile.value = profile.profile;
  }

}
