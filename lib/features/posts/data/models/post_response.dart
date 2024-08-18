
import 'package:benmore_amos/features/auth/data/models/user_model.dart';

class PostsResponse {
  final int? page;
  final int? limit;
  final int? totalPosts;
  final List<Post>? posts;

  PostsResponse({
    this.page,
    this.limit,
    this.totalPosts,
    this.posts,
  });

  factory PostsResponse.fromJson(Map<String, dynamic> json) => PostsResponse(
    page: json["page"],
    limit: json["limit"],
    totalPosts: json["totalPosts"],
    posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "totalPosts": totalPosts,
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
  };
}

class Post {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final int? likes;
  final User? assignedTo;
  final DateTime? createdAt;

  Post({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.likes,
    this.assignedTo,
    this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    imageUrl: json["image_url"],
    likes: json["likes"],
    assignedTo: json["assigned_to"] == null ? null : User.fromJson(json["assigned_to"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image_url": imageUrl,
    "likes": likes,
    "assigned_to": assignedTo?.toJson(),
    "created_at": createdAt?.toIso8601String(),
  };
}


