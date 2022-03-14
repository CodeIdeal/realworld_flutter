import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
import 'package:realworld_flutter/common/widget/app_bar.dart';
import 'package:realworld_flutter/common/widget/avatar_image.dart';
import 'package:realworld_flutter/common/widget/ripple_button.dart';

import 'logic.dart';

class ProfileEditPage extends GetView<ProfileEditLogic> {
  ProfileEditPage({Key? key}) : super(key: key);

  final String _tag = Get.arguments.toString();

  @override
  String? get tag => _tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(
        context: context,
        title: 'Edit Profile',
        rightMenu: GestureDetector(
          onTap: () => controller.logout(),
          child: Icon(
            Icons.logout_rounded,
            color: AppColors.main,
            size: AppSize.w_48,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.w_32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.w_96),
            GestureDetector(
              onTap: () => controller.choosePic(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(() {
                    return AvatarImage(
                      url: controller.state.profile.value?.image ?? '',
                      size: AppSize.w_168,
                      hasBorder: true,
                      borderWidth: AppSize.w_4,
                    );
                  }),
                  Opacity(
                    opacity: 0.9,
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: AppSize.w_96,
                      color: AppColors.main,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.w_60),
            Obx(() {
              return Text(
                controller.state.profile.value?.username ?? '',
                style: TextStyle(
                  color: AppColors.app_383A3C,
                  fontSize: AppSize.s_36,
                  fontWeight: FontWeight.w500,
                ),
              );
            }),
            SizedBox(height: AppSize.w_96),
            TextField(
              controller: controller.bio,
              style: TextStyle(
                color: AppColors.app_989898,
                fontSize: AppSize.s_28,
              ),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: 'BIO',
                  hintText: 'Enter your bio'),
            ),
            const Spacer(),
            RippleButton(
              onTap: () => controller.submit(),
              height: AppSize.w_96,
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.all(Radius.circular(AppSize.r_8)),
              ),
              child: Text(
                'Update',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppSize.s_28,
                ),
              ),
            ),
            SizedBox(height: AppSize.w_24),
          ],
        ),
      ),
    );
  }
}
