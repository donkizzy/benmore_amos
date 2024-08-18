import 'package:benmore_amos/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class FollowResponse extends Equatable{
  final String? message;
  final User? user;

  const FollowResponse({
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

  @override
  List<Object?> get props => [];
}