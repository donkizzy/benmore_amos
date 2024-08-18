import 'package:benmore_amos/features/posts/data/models/post_response.dart';
import 'package:equatable/equatable.dart';

class CreatePostResponse extends Equatable{
  final String? message;
  final Post? post;

  const CreatePostResponse({
    this.message,
    this.post,
  });

  factory CreatePostResponse.fromJson(Map<String, dynamic> json) => CreatePostResponse(
    message: json["message"],
    post: json["post"] == null ? null : Post.fromJson(json["post"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "post": post?.toJson(),
  };

  @override
  List<Object?> get props => [message, post];
}

