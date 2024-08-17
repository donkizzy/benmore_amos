import 'package:benmore_amos/features/auth/data/models/user_model.dart';

class AuthResponse {
  final String? message;
  final User? user;
  final String? token;

  AuthResponse({
    this.message,
    this.user,
    this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
    "token": token,
  };
}

