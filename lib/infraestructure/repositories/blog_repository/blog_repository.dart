import 'package:app_template/domain/datasource/datasource.dart';
import 'package:app_template/domain/entities/blog/create_blog.dart';
import 'package:app_template/domain/entities/blog/create_comment.dart';
import 'package:app_template/domain/entities/blog/get_blog.dart';
import 'package:app_template/domain/entities/blog/get_comments.dart';
import 'package:app_template/domain/entities/blog/voted_blog.dart';
import 'package:app_template/domain/repositories/repository.dart';
import 'package:app_template/infraestructure/datasources/blog_datasource/blog_datasource.dart';

class BlogRepositoryImpl extends BlogRepository {
  final BlogDatasource datasource;

  BlogRepositoryImpl([BlogDatasource? datasource])
      : datasource = datasource ?? BlogImpDatasource();

  @override
  Future<List<Blog>> getBlogs(
      {required String token, int page = 1, int limit = 10}) {
        return datasource.getBlogs(token: token, page: page, limit: limit);
  }

  @override
  Future<CreateBlog> createBlog({required String token, required String title, required String body, String? image}) {
    return datasource.createBlog(token: token, title: title, body: body, image: image);
  }

  @override
  Future<VotedBlog> voteBlog({required String token, required String blogId}) {
    return datasource.voteBlog(token: token, blogId: blogId);
  }

  @override
  Future<List<GetComments>> getComments({required String token, required String blogId}) {
    return datasource.getComments(token: token, blogId: blogId);
  }

  @override
  Future<CreateComment> createComment({required String token, required String blogId, required String body}) {
    return datasource.createComment(token: token, blogId: blogId, body: body);
  }
}
