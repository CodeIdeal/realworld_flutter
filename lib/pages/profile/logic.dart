import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/widget/load_wrapper.dart';
import 'package:realworld_flutter/model/resp/profile_resp.dart';
import 'package:realworld_flutter/service/rest_client.dart';

import 'state.dart';

class ProfileLogic extends GetxController with GetTickerProviderStateMixin  {
  final ProfileState state = ProfileState();
  late final TabController tabController;
  final LoadController myListController = LoadController();
  final LoadController favListController = LoadController();
  static const tabsKey = 'tabsKey';
  static const tabs = ['My Articles', 'Favorited Articles'];

  @override
  void onInit(){
    super.onInit();
    tabController = TabController(length: tabs.length,vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
    fetchUserInfo();
  }

  @override
  void onClose(){
    super.onClose();
    tabController.dispose();
    myListController.dispose();
    favListController.dispose();
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
