import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
import 'package:realworld_flutter/common/widget/app_bar.dart';
import 'package:realworld_flutter/common/widget/ripple_button.dart';

import 'logic.dart';

class ArticlePostPage extends GetView<ArticlePostLogic> {
  const ArticlePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PageBar(
        context: context,
        title: 'New Article',
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.w_16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(AppSize.w_24),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    hintText: 'Article title',
                  ),
                  style: TextStyle(
                    color: AppColors.app_383A3C,
                    fontSize: AppSize.s_32,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: controller.titleController,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppSize.w_24),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    hintText: 'What\'s this article about?',
                  ),
                  style: TextStyle(
                      color: AppColors.app_989898,
                      fontSize: AppSize.s_24,
                      fontStyle: FontStyle.italic),
                  controller: controller.descController,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppSize.w_24),
                child: TextField(
                  textInputAction: TextInputAction.newline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Content',
                    alignLabelWithHint: true,
                    hintText: 'Write your article (in markdown)',
                  ),
                  style: TextStyle(
                    color: AppColors.app_383A3C,
                    fontSize: AppSize.s_28,
                  ),
                  controller: controller.bodyController,
                  minLines: 5,
                  maxLines: 50,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppSize.w_24),
                child: TextField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tags',
                    hintText: 'Enter tags',
                  ),
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: AppSize.s_28,
                  ),
                  onSubmitted: (tag) => controller.addTag(tag),
                  controller: controller.tagController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.w_24),
                child: SizedBox(
                  height: AppSize.w_48,
                  child: Obx(() {
                    return ListView.separated(
                      itemBuilder: (context, index) => _genTag(index),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: AppSize.w_12),
                      itemCount: controller.state.tags.length,
                      scrollDirection: Axis.horizontal,
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.postArticle(),
        child: Icon(
          Icons.send_rounded,
          size: AppSize.w_48,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.main,
      ),
    );
  }

  Widget _genTag(int index) {
    return RippleButton(
      onTap: () => controller.deleteTag(index),
      padding: EdgeInsets.symmetric(horizontal: AppSize.w_16),
      decoration: BoxDecoration(
        color: AppColors.app_838A90,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.w_48)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.cancel_rounded,
            color: AppColors.white,
            size: AppSize.w_24,
          ),
          SizedBox(width: AppSize.w_8),
          Text(
            controller.state.tags[index],
            style: TextStyle(
              color: AppColors.white,
              fontSize: AppSize.s_20,
            ),
          ),
        ],
      ),
    );
  }
}
