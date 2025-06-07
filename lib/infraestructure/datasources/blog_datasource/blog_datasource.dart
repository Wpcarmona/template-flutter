import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:app_template/config/constants/environment.dart';
import 'package:app_template/domain/datasource/datasource.dart';
import 'package:app_template/domain/entities/blog/create_blog.dart';
import 'package:app_template/domain/entities/blog/create_comment.dart';
import 'package:app_template/domain/entities/blog/get_blog.dart';
import 'package:app_template/domain/entities/blog/get_comments.dart';
import 'package:app_template/domain/entities/blog/voted_blog.dart';
import 'package:app_template/infraestructure/mappers/blog/blog_mapper.dart';
import 'package:app_template/infraestructure/models/blog/create_blog.dart';
import 'package:app_template/infraestructure/models/blog/create_comment.dart';
import 'package:app_template/infraestructure/models/blog/get_comments.dart';
import 'package:app_template/infraestructure/models/models.dart';

class BlogImpDatasource extends BlogDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.baseUrl));

  List<Blog> _jsonToBlogList(Map<String, dynamic> json) {
    final blogResponse = BlogResponse.fromJson(json);
    return blogResponse.data.blogPosts.map(BlogMapper.blogToEntity).toList();
  }

  CreateBlog _jsonToCreateBlog(Map<String, dynamic> json) {
    final createBlogResponse = CreateBlogResponse.fromJson(json);
    return BlogMapper.createBlogToEntity(createBlogResponse);
  }

  VotedBlog _jsonToVotedBlog(Map<String, dynamic> json) {
    final votedBlogResponse = VotedBlogResponse.fromJson(json);
    return BlogMapper.votedBlogToEntity(votedBlogResponse);
  }

  List<GetComments> _jsonToGetComments(Map<String, dynamic> json) {
    final getCommentsResponse = GetCommentsResponse.fromJson(json);
    return getCommentsResponse.data.comments
        .map(BlogMapper.getCommentsToEntity)
        .toList();
  }

  CreateComment _jsonToCreateComment(Map<String, dynamic> json) {
    final createCommentResponse = CreateCommentResponse.fromJson(json);
    return BlogMapper.createCommentToEntity(createCommentResponse);
  }

  @override
  Future<List<Blog>> getBlogs(
      {required String token, int page = 1, int limit = 10}) async {
    final response = await dio.post('/blogs/list',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }));
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToBlogList(responseData);
  }

  @override
  Future<CreateBlog> createBlog(
      {required String token,
      required String title,
      required String body,
      String? image}) async {
    final response = await dio.post('/blogs',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {
          'blog_post': {"title": title, "body": body, "image": image}
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToCreateBlog(responseData);
  }

  @override
  Future<VotedBlog> voteBlog(
      {required String token, required String blogId}) async {
    final response = await dio.post('/votes',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {'target_id': blogId, 'category': 'like'});
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToVotedBlog(responseData);
  }

  @override
  Future<List<GetComments>> getComments(
      {required String token, required String blogId}) async {
    final response = await dio.post('/comments/list',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {
          'target_id': blogId,
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToGetComments(responseData);
  }

  @override
  Future<CreateComment> createComment(
      {required String token,
      required String blogId,
      required String body}) async {
    final response = await dio.post('/comments',
        options: Options(headers: {
          'Authorization': 'bearer $token',
        }),
        data: {
          'target_id': blogId,
          'comment': {
            'body': body,
          }
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToCreateComment(responseData);
  }
}
