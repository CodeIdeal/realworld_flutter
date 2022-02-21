import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:realworld_flutter/common/constant/app_colors.dart';
import 'package:realworld_flutter/common/constant/app_size.dart';
import 'package:realworld_flutter/common/util/toast_utils.dart';
import 'package:realworld_flutter/common/widget/avatar_image.dart';
import 'package:realworld_flutter/common/widget/load_wrapper.dart';
import 'package:realworld_flutter/common/widget/ripple_button.dart';
import 'package:realworld_flutter/model/entity/article.dart';
import 'package:realworld_flutter/model/resp/article_resp.dart';
import 'package:realworld_flutter/pages/pages.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.w_24),
      child: LoadWrapper<Article>(
        child: ListView.separated(
          itemBuilder: (context, index) => _buildArticleItem(articles[index]),
          separatorBuilder: (context, index) =>
              Divider(height: AppSize.w_24, color: Colors.transparent),
          itemCount: articles.length,
        ),
        pageService: (offset, limit) => fetchArticles(offset, limit),
        onPageLoaded: (list) => setState(() => articles = list),
      ),
    );
  }

  Widget _buildArticleItem(Article article) {
    return GestureDetector(
      onTap: () => Get.toNamed(Pages.articleDetail, arguments: article),
      child: Container(
        padding: EdgeInsets.all(AppSize.w_24),
        margin: EdgeInsets.symmetric(horizontal: AppSize.w_24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.w_24)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(Pages.profile,
                      arguments: article.author.username),
                  child: AvatarImage(
                    url: article.author.image,
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
                      article.author.username,
                      style: TextStyle(
                        color: AppColors.main,
                        fontSize: AppSize.s_24,
                      ),
                    ),
                    SizedBox(height: AppSize.w_8),
                    Text(
                      DateFormat.yMMMMEEEEd()
                          .format(DateTime.tryParse(article.createdAt)!),
                      style: TextStyle(
                        color: AppColors.app_989898,
                        fontSize: AppSize.s_18,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                RippleButton(
                  onTap: () => toggleFav(article),
                  padding: EdgeInsets.all(AppSize.w_4),
                  decoration: BoxDecoration(
                    color: article.favorited
                        ? AppColors.main
                        : AppColors.transparent,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.r_8)),
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
                            article.favorited ? Colors.white : AppColors.main,
                      ),
                      SizedBox(width: AppSize.w_4),
                      Text(
                        article.favoritesCount.toString(),
                        style: TextStyle(
                          color:
                              article.favorited ? Colors.white : AppColors.main,
                          fontSize: AppSize.s_14,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.w_24),
            Text(
              article.title,
              style: TextStyle(
                color: AppColors.app_383A3C,
                fontSize: AppSize.s_36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              article.description,
              style: TextStyle(
                color: AppColors.app_808080,
                fontSize: AppSize.s_28,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: AppSize.w_24),
            Row(
              children: (article.tagList.mapMany((tag) => [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          AppSize.w_8, AppSize.w_4, AppSize.w_8, AppSize.w_4),
                      decoration: BoxDecoration(
                        color: AppColors.transparent,
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppSize.r_12)),
                        border: Border.all(
                          color: AppColors.app_989898,
                          width: AppSize.w_1,
                        ),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: AppColors.app_989898,
                          fontSize: AppSize.s_16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: AppSize.w_8),
                  ])).toList(),
            )
          ],
        ),
      ),
    );
  }

  Future<List<Article>> fetchArticles([int offset = 0, int limit = 10]) async {
    try {
      final resp = await RestClient.client.getArticles(
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
        resp = await RestClient.client.unfavoriteArticle(article.slug);
      } else {
        resp = await RestClient.client.favoriteArticle(article.slug);
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
