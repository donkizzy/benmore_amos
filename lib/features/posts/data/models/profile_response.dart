import 'package:equatable/equatable.dart';

class ProfileResponse  extends Equatable{
  final String? id;
  final String? username;
  final String? email;
  final String? profilePicture;
  final int? totalLikesGiven;
  final int? totalFollowers;
  final int? profileViews;
  final bool? isFollowing;

  const ProfileResponse({
    this.id,
    this.username,
    this.email,
    this.profilePicture,
    this.totalLikesGiven,
    this.totalFollowers,
    this.profileViews,
    this.isFollowing,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    profilePicture: json["profile_picture"],
    totalLikesGiven: json["totalLikesGiven"],
    totalFollowers: json["totalFollowers"],
    profileViews: json["profileViews"],
    isFollowing: json["isFollowing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "profile_picture": profilePicture,
    "totalLikesGiven": totalLikesGiven,
    "totalFollowers": totalFollowers,
    "profileViews": profileViews,
    "isFollowing": isFollowing,
  };

  @override
  List<Object?> get props => [id, username, email, profilePicture, totalLikesGiven, totalFollowers, profileViews,isFollowing];
}

