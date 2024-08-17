import 'package:benmore_amos/features/auth/data/models/following_model.dart';

class CommentResponse {
  final String? id;
  final String? user;
  final String? comment;
  final int? likes;
  final List<Following>? likedBy;
  final DateTime? timestamp;

  CommentResponse({
    this.id,
    this.user,
    this.comment,
    this.likes,
    this.likedBy,
    this.timestamp,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) => CommentResponse(
    id: json["id"],
    user: json["user"],
    comment: json["comment"],
    likes: json["likes"],
    likedBy: json["likedBy"] == null ? [] : List<Following>.from(json["likedBy"]!.map((x) => x)),
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user,
    "comment": comment,
    "likes": likes,
    "likedBy": likedBy == null ? [] : List<dynamic>.from(likedBy!.map((x) => x)),
    "timestamp": timestamp?.toIso8601String(),
  };
}
