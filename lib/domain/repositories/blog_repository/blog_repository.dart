
import 'package:app_template/domain/entities/entities.dart';

abstract class BlogRepository {
  Future<List<Blog>> getBlogs({
    required String token,
    int page = 1,
    int limit = 10,
  });

   Future<CreateBlog> createBlog({
    required String token,
    required String title,
    required String body,
    String? image,
  });

  Future<VotedBlog> voteBlog({
    required String token,
    required String blogId,
  });

  Future<List<GetComments>> getComments({
    required String token,
    required String blogId,
  });

  Future<CreateComment> createComment({
    required String token,
    required String blogId,
    required String body,
  });
}