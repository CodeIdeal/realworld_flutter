// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.realworld.io/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserResp> addUser(addUser) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addUser.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserResp>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ArticleResp> createArticle(newArticle) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(newArticle.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ArticleResp>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/articles',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ArticleResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserResp> loginUser(login) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(login.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserResp>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ArticlesResp> getArticles(
      {author, tag, favoriteBy, limit = 10, offset = 0}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'author': author,
      r'tag': tag,
      r'favorited': favoriteBy,
      r'limit': limit,
      r'offset': offset
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ArticlesResp>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/articles',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ArticlesResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ArticlesResp> getFeedArticles() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ArticlesResp>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/articles/feed',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ArticlesResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProfileResp> getProfile(username) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProfileResp>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/profiles/${username}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProfileResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserResp> getCurrentUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserResp>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserResp> updateProfile(updateProfile) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateProfile.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserResp>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ArticleResp> favoriteArticle(slug) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ArticleResp>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/articles/${slug}/favorite',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ArticleResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ArticleResp> unfavoriteArticle(slug) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ArticleResp>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, '/articles/${slug}/favorite',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ArticleResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UploadPicResult> uploadPic(file) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': 't4dlCdMmrN885Qc0dFRb3TJR9aVGw5cH',
      r'Content-Type': 'multipart/form-data'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.files.add(MapEntry(
        'smfile',
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UploadPicResult>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, 'https://sm.ms/api/v2/upload',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UploadPicResult.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
