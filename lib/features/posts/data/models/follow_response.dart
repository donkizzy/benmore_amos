import 'package:benmore_amos/features/auth/data/models/user_model.dart';

class FollowResponse {
  final String? message;
  final User? user;

  FollowResponse({
    this.message,
    this.user,
  });

  factory FollowResponse.fromJson(Map<String, dynamic> json) => FollowResponse(
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
  };
}