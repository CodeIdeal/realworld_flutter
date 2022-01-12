import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/widget/app_bar.dart';
import 'package:realworld_flutter/common/widget/ripple_button.dart';
import 'package:realworld_flutter/model/entity/article.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class ArticlesPage extends StatelessWidget {
  final logic = Get.find<ArticlesLogic>();
  final state = Get.find<ArticlesLogic>().state;

  ArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(
        context: context,
        leftMenu: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Text(
            'conduit',
            style: TextStyle(
              color: AppColors.main,
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Obx(() {
        return ListView.separated(
          itemBuilder: (context, index) =>
              _buildArticleItem(state.articles[index]),
          separatorBuilder: (context, index) => Divider(height: 1.w),
          itemCount: state.articles.length,
        );
      }),
    );
  }

  Widget _buildArticleItem(Article article) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(48.w)),
                  border: Border.all(color: AppColors.main, width: 1.w),
                ),
                padding: EdgeInsets.all(8.w),
                child: Image.network(
                  article.author.image,
                  width: 48.w,
                  height: 48.w,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, progress) => Icon(
                    Icons.people_rounded,
                    size: 48.w,
                    color: AppColors.main,
                  ),
                  errorBuilder: (context, error, stacktrace) => Icon(
                    Icons.people_rounded,
                    size: 48.w,
                    color: AppColors.main,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.author.username,
                    style: TextStyle(
                      color: AppColors.main,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 8.w),
                  Text(
                    DateFormat.yMMMMEEEEd()
                        .format(DateTime.tryParse(article.createdAt)!),
                    style: TextStyle(
                      color: AppColors.app_989898,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              RippleButton(
                onTap: () => logic.toggleFav(article),
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  border: Border.all(
                    color: AppColors.main,
                    width: 2.w,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_rounded,
                      size: 24.w,
                      color: AppColors.main,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      article.favoritesCount.toString(),
                      style: TextStyle(
                        color: AppColors.main,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.w),
          Text(
            article.title,
            style: TextStyle(
              color: AppColors.app_3C3C3C,
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            article.description,
            style: TextStyle(
              color: AppColors.app_808080,
              fontSize: 28.sp,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 24.w),
          Row(
            children: (article.tagList.mapMany((tag) => [
                  Container(
                    padding: EdgeInsets.fromLTRB(8.w, 4.w, 8.w, 4.w),
                    decoration: BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      border: Border.all(
                        color: AppColors.app_989898,
                        width: 0.5.w,
                      ),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: AppColors.app_989898,
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 8.w),
                ])).toList(),
          )
        ],
      ),
    );
  }
}
