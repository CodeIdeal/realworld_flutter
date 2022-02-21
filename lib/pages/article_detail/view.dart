import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
import 'package:realworld_flutter/common/util/auth_manager.dart';
import 'package:realworld_flutter/common/widget/app_bar.dart';
import 'package:realworld_flutter/common/widget/avatar_image.dart';
import 'package:realworld_flutter/common/widget/ripple_button.dart';
import 'package:realworld_flutter/model/entity/comment.dart';
import 'package:realworld_flutter/pages/pages.dart';

import 'logic.dart';

class ArticleDetailPage extends GetView<ArticleDetailLogic> {
  ArticleDetailPage({Key? key}) : super(key: key);

  final String _tag = Get.arguments.toString();

  @override
  String? get tag => _tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PageBar(
        context: context,
      ),
      body: Obx(
        () => controller.state.article.value == null
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.all(AppSize.w_24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.state.articleTitle ?? '',
                      style: TextStyle(
                        color: AppColors.main,
                        fontSize: AppSize.s_48,
                      ),
                    ),
                    SizedBox(height: AppSize.w_24),
                    _genAuthor(),
                    SizedBox(height: AppSize.w_24),
                    Text(
                      controller.state.body ?? '',
                      style: TextStyle(
                        color: AppColors.app_383A3C,
                        fontSize: AppSize.s_32,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: AppSize.w_24),
                    if (controller.state.comments.isNotEmpty) ...[
                      Divider(height: AppSize.w_2),
                      SizedBox(height: AppSize.w_24),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              _genComments(controller.state.comments[index]),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.w_12),
                          itemCount: controller.state.comments.length,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
      ),
    );
  }

  Widget _genAuthor() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(Pages.profile,
              arguments: controller.state.article.value!.author.username),
          child: AvatarImage(
            url: controller.state.article.value!.author.image,
            hasBorder: true,
            borderWidth: AppSize.w_2,
            size: AppSize.w_56,
          ),
        ),
        SizedBox(width: AppSize.w_12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.state.article.value!.author.username,
              style: TextStyle(
                color: AppColors.main,
                fontSize: AppSize.s_24,
              ),
            ),
            SizedBox(height: AppSize.w_8),
            Text(
              DateFormat.yMMMMEEEEd().format(DateTime.tryParse(
                  controller.state.article.value!.createdAt)!),
              style: TextStyle(
                color: AppColors.app_989898,
                fontSize: AppSize.s_18,
              ),
            ),
          ],
        ),
        const Spacer(),
        RippleButton(
          onTap: () => controller.follow(),
          padding: EdgeInsets.all(AppSize.w_8),
          decoration: BoxDecoration(
            color: controller.state.isFollowing
                ? AppColors.main
                : AppColors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.r_8)),
            border: Border.all(
              color: AppColors.main,
              width: AppSize.w_2,
            ),
          ),
          child: Row(
            children: [
              Icon(
                controller.state.isFollowing
                    ? Icons.remove_rounded
                    : Icons.add_rounded,
                size: AppSize.w_24,
                color: controller.state.isFollowing
                    ? Colors.white
                    : AppColors.main,
              ),
              SizedBox(width: AppSize.w_4),
              Text(
                controller.state.isFollowing ? 'Unfollow' : 'Follow',
                style: TextStyle(
                  color: controller.state.isFollowing
                      ? Colors.white
                      : AppColors.main,
                  fontSize: AppSize.s_24,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        SizedBox(width: AppSize.w_24),
        RippleButton(
          onTap: () => controller.toggleFav(),
          padding: EdgeInsets.all(AppSize.w_8),
          decoration: BoxDecoration(
            color: controller.state.isFavorite
                ? AppColors.main
                : AppColors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.r_8)),
            border: Border.all(
              color: AppColors.main,
              width: AppSize.w_2,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.favorite_rounded,
                size: AppSize.w_24,
                color:
                    controller.state.isFavorite ? Colors.white : AppColors.main,
              ),
              SizedBox(width: AppSize.w_4),
              Text(
                controller.state.favoriteCount.toString(),
                style: TextStyle(
                  color: controller.state.isFavorite
                      ? Colors.white
                      : AppColors.main,
                  fontSize: AppSize.s_24,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _genComments(Comment comment) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.app_EEEEEE,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.r_8)),
        border: Border.all(color: AppColors.app_E5E5E5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppSize.w_16),
            child: Text(
              comment.body,
              style: TextStyle(
                color: AppColors.app_383A3C,
                fontSize: AppSize.s_28,
              ),
            ),
          ),
          const Divider(
            height: 1.0,
            color: AppColors.app_E5E5E5,
          ),
          Padding(
            padding: EdgeInsets.all(AppSize.w_16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(Pages.profile,
                      arguments: comment.author.username),
                  child: AvatarImage(
                    url: comment.author.image,
                    hasBorder: true,
                    borderWidth: AppSize.w_2,
                    size: AppSize.w_56,
                  ),
                ),
                SizedBox(width: AppSize.w_12),
                Text(
                  comment.author.username,
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: AppSize.s_24,
                  ),
                ),
                SizedBox(width: AppSize.w_12),
                Text(
                  DateFormat.yMMMMEEEEd()
                      .format(DateTime.tryParse(comment.createdAt)!),
                  style: TextStyle(
                    color: AppColors.app_989898,
                    fontSize: AppSize.s_18,
                  ),
                ),
                const Spacer(),
                if (comment.author.username == AuthManager.userName)
                  GestureDetector(
                    onTap: () => controller.deleteComment(comment),
                    child: Icon(
                      Icons.delete_rounded,
                      size: AppSize.w_36,
                      color: AppColors.app_BBBBBB,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
