import 'dart:io';

import 'package:dio/dio.dart';
import 'package:realworld_flutter/common/constant/app_config.dart';
import 'package:realworld_flutter/common/constant/app_keys.dart';
import 'package:realworld_flutter/common/http/dio_manager.dart';
import 'package:realworld_flutter/common/util/storage.dart';
import 'package:realworld_flutter/model/req/add_user.dart';
import 'package:realworld_flutter/model/req/create_article.dart';
import 'package:realworld_flutter/model/req/login.dart';
import 'package:realworld_flutter/model/req/update_profile.dart';
import 'package:realworld_flutter/model/resp/article_resp.dart';
import 'package:realworld_flutter/model/resp/articles_resp.dart';
import 'package:realworld_flutter/model/resp/comments_resp.dart';
import 'package:realworld_flutter/model/resp/profile_resp.dart';
import 'package:realworld_flutter/model/resp/upload_pic_result_resp.dart';
import 'package:realworld_flutter/model/resp/user_resp.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

part 'rest_client.g.dart';

@retrofit.RestApi(baseUrl: AppConfig.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient get client => RestClient(DioManager.dio,
      baseUrl: Storage.getString(AppKeys.baseUrl) ?? AppConfig.baseUrl);

  // add new user in database
  @retrofit.POST("/users")
  Future<UserResp> addUser(@retrofit.Body() AddUser addUser);

  // add new article in database
  @retrofit.POST("/articles")
  Future<ArticleResp> createArticle(@retrofit.Body() CreateArticle newArticle);

  // login user in database
  @retrofit.POST("/users/login")
  Future<UserResp> loginUser(@retrofit.Body() Login login);

  // get articles
  @retrofit.GET("/articles")
  Future<ArticlesResp> getArticles({
    @retrofit.Query("author") String? author,
    @retrofit.Query("tag") String? tag,
    @retrofit.Query("favorited") String? favoriteBy,
    @retrofit.Query("limit") int limit = 10,
    @retrofit.Query("offset") int offset = 0,
  });

  //get feed
  @retrofit.GET("/articles/feed")
  Future<ArticlesResp> getFeedArticles();

  //get feed
  @retrofit.GET("/articles/{slug}/comments/")
  Future<CommentsResp> getArticleComment(@retrofit.Path("slug") String slug);

  //get Profile
  @retrofit.GET("/profiles/{username}")
  Future<ProfileResp> getProfile(@retrofit.Path("username") String username);

  //get current user
  @retrofit.GET("user")
  Future<UserResp> getCurrentUser();

  //update Profile
  @retrofit.PUT("user")
  Future<UserResp> updateProfile(@retrofit.Body() UpdateProfile updateProfile);

  //favorite article
  @retrofit.POST("/articles/{slug}/favorite")
  Future<ArticleResp> favoriteArticle(@retrofit.Path('slug') String slug);

  //unfavorite article
  @retrofit.DELETE("/articles/{slug}/favorite")
  Future<ArticleResp> unfavoriteArticle(@retrofit.Path('slug') String slug);

  //follow user
  @retrofit.POST("/profiles/{username}/follow")
  Future<ProfileResp> followUser(@retrofit.Path('username') String username);

  //unfollow user
  @retrofit.DELETE("/profiles/{username}/follow")
  Future<ProfileResp> unfollowUser(@retrofit.Path('username') String username);

  //upload pic
  @retrofit.POST(AppConfig.picUrl)
  @retrofit.Headers({
    "Authorization": AppConfig.picToken,
    "Content-Type": "multipart/form-data",
  })
  Future<UploadPicResult> uploadPic(@retrofit.Part(name: 'smfile') File file);
}
