import 'package:dio/dio.dart';
import 'package:realworld_flutter/model/req/add_user.dart';
import 'package:realworld_flutter/model/req/create_article.dart';
import 'package:realworld_flutter/model/req/login.dart';
import 'package:realworld_flutter/model/req/update_profile.dart';
import 'package:realworld_flutter/model/resp/article_resp.dart';
import 'package:realworld_flutter/model/resp/articles_resp.dart';
import 'package:realworld_flutter/model/resp/profile_resp.dart';
import 'package:realworld_flutter/model/resp/user_resp.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.realworld.io/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // add new user in database
  @POST("/users")
  Future<UserResp> addUser(@Body() AddUser addUser);

  // add new article in database
  @POST("/articles")
  Future<ArticleResp> createArticle(@Body() CreateArticle newArticle);

  // login user in database
  @POST("/users/login")
  Future<UserResp> loginUser(@Body() Login login);

  // get articles
  @GET("/articles")
  Future<ArticlesResp> getArticles([
    @Query("author") String? author,
    @Query("tag") List<String>? tag,
    @Query("favorited") String? favorited,
    @Query("limit") int limit = 10,
    @Query("offset") int offset = 0,
  ]);

  //get feed
  @GET("/articles/feed")
  Future<ArticlesResp> getFeedArticles();

  //get Profile
  @GET("/profiles/{username}")
  Future<ProfileResp> getProfile(@Path("username") String username);

  //get current user
  @GET("user")
  Future<UserResp> getCurrentUser();

  //update Profile
  @PUT("user")
  Future<UserResp> updateProfile(@Body() UpdateProfile updateProfile);

  //favorite article
  @POST("/articles/{slug}/favorite")
  Future<ArticleResp> favoriteArticle(@Path('slug') String slug);

  //unfavorite article
  @DELETE("/articles/{slug}/favorite")
  Future<ArticleResp> unfavoriteArticle(@Path('slug') String slug);
}
