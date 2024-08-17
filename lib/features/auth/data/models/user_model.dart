import 'package:benmore_amos/features/auth/data/models/following_model.dart';

class User {
  final String? id;
  final String? username;
  final String? email;
  final String? profilePicture;
  final List<Following>? followers;
  final List<Following>? following;

  User({
    this.id,
    this.username,
    this.email,
    this.profilePicture,
    this.followers,
    this.following,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    profilePicture: json["profile_picture"],
    followers: json["followers"] == null ? [] : List<Following>.from(json["followers"]!.map((x) => x)),
    following: json["following"] == null ? [] : List<Following>.from(json["following"]!.map((x) => Following.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "profile_picture": profilePicture,
    "followers": followers == null ? [] : List<dynamic>.from(followers!.map((x) => x)),
    "following": following == null ? [] : List<dynamic>.from(following!.map((x) => x.toJson())),
  };
}