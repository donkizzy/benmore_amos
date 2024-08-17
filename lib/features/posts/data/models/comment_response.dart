import 'package:benmore_amos/features/auth/data/models/following_model.dart';

class CommentResponse {
  final int? page;
  final int? limit;
  final int? totalComments;
  final List<Comment>? comments;

  CommentResponse({
    this.page,
    this.limit,
    this.totalComments,
    this.comments,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) => CommentResponse(
    page: json["page"],
    limit: json["limit"],
    totalComments: json["totalComments"],
    comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "totalComments": totalComments,
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
  };
}

class Comment {
  final String? id;
  final Following? user;
  final String? comment;
  final int? likes;
  final List<dynamic>? likedBy;
  final DateTime? createdAt;

  Comment({
    this.id,
    this.user,
    this.comment,
    this.likes,
    this.likedBy,
    this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    user: json["user"] == null ? null : Following.fromJson(json["user"]),
    comment: json["comment"],
    likes: json["likes"],
    likedBy: json["likedBy"] == null ? [] : List<dynamic>.from(json["likedBy"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user?.toJson(),
    "comment": comment,
    "likes": likes,
    "likedBy": likedBy == null ? [] : List<dynamic>.from(likedBy!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
  };
}
