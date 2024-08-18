import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String? id;
  final String? username;
  final String? email;
  final String? profilePicture;

 const  User({
    this.id,
    this.username,
    this.email,
    this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "profile_picture": profilePicture,
  };

  @override
  List<Object?> get props => [id, username, email, profilePicture];
}