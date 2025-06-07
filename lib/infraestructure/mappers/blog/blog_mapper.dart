

import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/models/blog/create_blog.dart';
import 'package:app_template/infraestructure/models/blog/create_comment.dart';
import 'package:app_template/infraestructure/models/blog/get_comments.dart';
import 'package:app_template/infraestructure/models/models.dart';

class BlogMapper {

  static Blog blogToEntity(BlogPost blog) => Blog(
    id: blog.id, 
    title: blog.title, 
    body: blog.body, 
    date: blog.executeDate, 
    votesCount: blog.votesCount, 
    isVoted: blog.voted, 
    participant: Participant(
      id: blog.participant.id, 
      email: blog.participant.email, 
      name: blog.participant.name, 
      avatar: blog.participant.avatar, 
      uid: blog.participant.uid, 
      uidType: blog.participant.uidType ?? '', 
      state: blog.participant.state)
    );

  static CreateBlog createBlogToEntity(CreateBlogResponse createBlog) => CreateBlog(
    ok: createBlog.ok,
    message: createBlog.message,
  );

  static VotedBlog votedBlogToEntity(VotedBlogResponse votedBlog) => VotedBlog(
    ok: votedBlog.ok,
    message: votedBlog.message,
  );

  static GetComments getCommentsToEntity(Comment comment) => GetComments(
    id: comment.id, 
    body: comment.body,
    date: comment.executeDate,
    isVoted: comment.voted,
    participant: Participant(
      id: comment.participant.id,
      avatar: comment.participant.avatar,
      email: comment.participant.email,
      name: comment.participant.name,
      uid: comment.participant.uid,
      uidType: comment.participant.uidType ?? '',
      state: comment.participant.state
      )
   );

   static CreateComment createCommentToEntity(CreateCommentResponse createComment) => CreateComment(
    ok: createComment.ok,
    message: createComment.message,
   );
}