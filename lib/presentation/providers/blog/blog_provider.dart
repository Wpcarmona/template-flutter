
import 'package:app_template/config/constants/app_keys.dart';
import 'package:app_template/presentation/utils/dio_exception_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/domain/repositories/repository.dart';
import 'package:app_template/infraestructure/repositories/repositories_infraestructure.dart';
import 'package:app_template/presentation/infraestructure/services/key_value_storage_service.dart';
import 'package:app_template/presentation/infraestructure/services/key_value_storage_service_impl.dart';

enum BlogStatus {
  initial,
  loading,
  success,
  error,
}

final blogProvider = StateNotifierProvider<BlogNotifier, BlogState>((ref) {
  final blogRepository = BlogRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return BlogNotifier(
    ref: ref,
    blogRepository: blogRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class BlogNotifier extends StateNotifier<BlogState> {
  final Ref ref;
  final BlogRepository blogRepository;
  final KeyValueStorageService keyValueStorageService;

  BlogNotifier({
    required this.ref,
    required this.blogRepository,
    required this.keyValueStorageService,
  }) : super(BlogState());

  Future<void> getBlogs() async {
    try {
      final token = await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token == null) return;
      final getBlog = await blogRepository.getBlogs(token: token);
      _setBlogs(getBlog);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
            errorMessage: message, blogStatus: BlogStatus.error);
      }, ref);
    }
  }

  Future<void> createBlog(String title, String body, String? image) async {
    try {
      final token = await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token == null) return;
      await blogRepository.createBlog(
          token: token, title: title, body: body, image: image);
      _setCreateBlog();
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
            errorMessage: message, blogStatus: BlogStatus.error);
      }, ref);
    }
  }

  Future<void> votedBlog(String id) async {
    try {
      final token = await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token == null) return;
      await blogRepository.voteBlog(token: token, blogId: id);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
            errorMessage: message, blogStatus: BlogStatus.error);
      }, ref);
    }
  }

  Future<void> getComment(String blogId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final token = await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token == null) {
        state = state.copyWith(isLoading: false);
        return;
      }

      final getComment =
          await blogRepository.getComments(token: token, blogId: blogId);

      _setComment(getComment);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
            errorMessage: message, blogStatus: BlogStatus.error);
      }, ref);
    }
  }

  Future<void> createComment(String blogId, String body) async {
    try {
      final token = await keyValueStorageService.getValue<String>(AppKeys.token);
      if (token == null) return;
      await blogRepository.createComment(
          token: token, blogId: blogId, body: body);
      _setCreateComment(blogId);
    } on DioException catch (e) {
      handleDioException(e, (message) {
        state = state.copyWith(
            errorMessage: message, blogStatus: BlogStatus.error);
      }, ref);
    }
  }

  _setBlogs(List<Blog> blogs) {
    state = state.copyWith(blogs: blogs);
  }

  _setComment(List<GetComments> comments) {
    state = state.copyWith(comments: comments, isLoading: false);
  }

  _setCreateBlog() {
    getBlogs();
  }

  _setCreateComment(String blogId) {
    getComment(blogId);
  }

  
}

class BlogState {
  final List<Blog> blogs;
  final List<GetComments> comments;
  final BlogStatus blogStatus;
  final bool isLoading;
  final String? errorMessage;

  BlogState(
      {this.blogs = const [],
      this.comments = const [],
      this.isLoading = false,
      this.blogStatus = BlogStatus.initial,
      this.errorMessage});

  BlogState copyWith({
    List<Blog>? blogs,
    List<GetComments>? comments,
    bool? isLoading,
    BlogStatus? blogStatus,
    String? errorMessage,
  }) =>
      BlogState(
        blogs: blogs ?? this.blogs,
        comments: comments ?? this.comments,
        isLoading: isLoading ?? this.isLoading,
        blogStatus: blogStatus ?? this.blogStatus,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
