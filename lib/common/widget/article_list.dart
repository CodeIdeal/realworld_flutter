import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
import 'package:realworld_flutter/common/http/dio_manager.dart';
import 'package:realworld_flutter/common/util/toast_utils.dart';
import 'package:realworld_flutter/common/widget/avatar_image.dart';
import 'package:realworld_flutter/common/widget/load_wrapper.dart';
import 'package:realworld_flutter/common/widget/ripple_button.dart';
import 'package:realworld_flutter/model/entity/article.dart';
import 'package:realworld_flutter/model/resp/article_resp.dart';
import 'package:realworld_flutter/service/rest_client.dart';

class ArticlesPage extends StatefulWidget {
  final String? author;
  final String? tag;
  final String? favoriteBy;

  const ArticlesPage({
    Key? key,
    this.author,
    this.tag,
    this.favoriteBy,
  }) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  var articles = <Article>[];

  @override
  Widget build(BuildContext context) {
    return LoadWrapper<Article>(
      child: ListView.separated(
        itemBuilder: (context, index) => _buildArticleItem(articles[index]),
        separatorBuilder: (context, index) => Divider(height: 1.w),
        itemCount: articles.length,
      ),
      pageService: (offset, limit) => fetchArticles(offset, limit),
      onPageLoaded: (list) => setState(() => articles = list),
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
              AvatarImage(
                url: article.author.image,
                hasBorder: true,
                borderWidth: AppSize.w_2,
                size: AppSize.w_56,
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
                onTap: () => toggleFav(article),
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: article.favorited
                      ? AppColors.main
                      : AppColors.transparent,
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
                      color: article.favorited ? Colors.white : AppColors.main,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      article.favoritesCount.toString(),
                      style: TextStyle(
                        color:
                            article.favorited ? Colors.white : AppColors.main,
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
              color: AppColors.app_383A3C,
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

  Future<List<Article>> fetchArticles([int offset = 0, int limit = 10]) async {
    try {
      final resp = await RestClient(DioManager.dio).getArticles(
        author: widget.author,
        tag: widget.tag,
        favoriteBy: widget.favoriteBy,
        offset: offset,
        limit: limit,
      );
      return resp.articles;
    } catch (e) {
      ToastUtils.showError(e);
      return [];
    }
  }

  toggleFav(Article article) async {
    ArticleResp resp;
    try {
      if (article.favorited) {
        resp = await RestClient(DioManager.dio).unfavoriteArticle(article.slug);
      } else {
        resp = await RestClient(DioManager.dio).favoriteArticle(article.slug);
      }
      final newArticle = resp.article;
      setState(() {
        final oldArticle =
            articles.firstWhere((p0) => p0.slug == newArticle.slug);
        oldArticle.favorited = newArticle.favorited;
        oldArticle.favoritesCount = newArticle.favoritesCount;
        oldArticle.updatedAt = newArticle.updatedAt;
      });
    } catch (e) {
      ToastUtils.showError(e);
    }
  }
}
