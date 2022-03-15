import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/util/auth_manager.dart';
import 'package:realworld_flutter/common/util/loading_dialog.dart';
import 'package:realworld_flutter/common/util/toast_utils.dart';
import 'package:realworld_flutter/model/req/update_profile.dart';
import 'package:realworld_flutter/model/resp/upload_pic_result_resp.dart';
import 'package:realworld_flutter/service/rest_client.dart';

import 'state.dart';

class ProfileEditLogic extends GetxController {
  final ProfileEditState state = ProfileEditState();
  final TextEditingController bio = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    try {
      state.profile(Get.arguments);
      bio.text = state.profile.value?.bio ?? '';
      email.text = state.profile.value?.bio ?? '';
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
    bio.dispose();
    email.dispose();
    password.dispose();
  }

  void choosePic() async {
    if (state.profile.value == null) {
      ToastUtils.show('get error when choose pic');
      return;
    }

    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      LoadingDialog.show();
      try {
        File file = File(result.files.first.path!);
        UploadPicResult uploadResult = await RestClient.client.uploadPic(file);
        if (uploadResult.code != "image_repeated" &&
            uploadResult.code != "success") {
          throw Exception('upload pic error!');
        }
        state.profile.update((val) {
          if (uploadResult.data != null) {
            val?.image = uploadResult.data!.url;
          } else {
            val?.image = uploadResult.images!;
          }
        });
        final newProfile = NewProfile(
          image: state.profile.value!.image,
        );
        final userResp = await RestClient.client.updateProfile(UpdateProfile(user: newProfile));
        AuthManager.login(userResp.user);
      } catch (e, stacktrace) {
        e.printError();
        log(stacktrace.toString());
        ToastUtils.showError(e);
      } finally {
        LoadingDialog.hide();
      }
    } else {
      ToastUtils.show('get error when choose pic');
    }
  }

  void submit() async {
    try {
      state.profile.update((val) {
        val?.bio = bio.value.text;
      });
      final newProfile = NewProfile(
        bio: state.profile.value!.bio,
      );
      final userResp = await RestClient.client.updateProfile(UpdateProfile(user: newProfile));
      AuthManager.login(userResp.user);
    } catch (e, stacktrace) {
      e.printError();
      log(stacktrace.toString());
      ToastUtils.showError(e);
    }
  }

  void logout() async {
    await AuthManager.logout('Manual', true);
  }
}
