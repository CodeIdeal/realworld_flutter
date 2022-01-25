import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
import 'package:realworld_flutter/common/widget/app_bar.dart';
import 'package:realworld_flutter/common/widget/article_list.dart';
import 'package:realworld_flutter/common/widget/avatar_image.dart';
import 'package:realworld_flutter/common/widget/keep_alive.dart';
import 'package:realworld_flutter/common/widget/loading_page.dart';
import 'package:realworld_flutter/common/widget/round_corner_indicator.dart';
import 'package:realworld_flutter/pages/pages.dart';

import 'logic.dart';

class ProfilePage extends GetView<ProfileLogic> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PageBar(
          context: context,
          rightMenu: controller.state.isCurrentUser
              ? GestureDetector(
                  onTap: () => Get.toNamed(
                    Pages.editProfile,
                    arguments: controller.state.profile,
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    color: AppColors.main,
                    size: AppSize.w_48,
                  ),
                )
              : const SizedBox.shrink(),
        ),
        body: DefaultTabController(
          length: ProfileLogic.tabs.length,
          child: Center(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AvatarImage(
                          url: controller.state.profile.value?.image ?? '',
                          size: AppSize.w_168,
                          hasBorder: true,
                          borderWidth: AppSize.w_4,
                        ),
                        SizedBox(height: AppSize.w_12),
                        Text(
                          controller.state.profile.value?.username ?? '',
                          style: TextStyle(
                            color: AppColors.app_383A3C,
                            fontSize: AppSize.s_36,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: AppSize.w_12),
                        Text(
                          controller.state.profile.value?.bio ??
                              'he or she left nothing.',
                          style: TextStyle(
                            color: AppColors.app_989898,
                            fontSize: AppSize.s_28,
                          ),
                        ),
                        SizedBox(height: AppSize.w_24),
                      ],
                    ),
                    childCount: 1,
                  ),
                ),
                SliverAppBar(
                  floating: false,
                  snap: false,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.bg,
                  toolbarHeight: AppSize.w_96,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: TabBar(
                      labelColor: AppColors.main,
                      unselectedLabelColor: AppColors.app_989898,
                      tabs: ProfileLogic.tabs
                          .map((e) => Tab(
                                text: e,
                                height: AppSize.w_92,
                              ))
                          .toList(),
                      indicator: RoundCornerIndicator(
                        color: AppColors.main,
                        radius: BorderRadius.all(Radius.circular(AppSize.r_4)),
                        height: AppSize.h_8,
                        padding: AppSize.w_100,
                      ),
                    ),
                  ),
                )
              ],
              body: controller.state.profile.value == null
                  ? const LoadingPage()
                  : TabBarView(
                      children: [
                        KeepAliveWrapper(
                          child: ArticlesPage(
                            author: controller.state.profile.value?.username,
                          ),
                        ),
                        KeepAliveWrapper(
                          child: ArticlesPage(
                            favoriteBy:
                                controller.state.profile.value?.username,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }
}
