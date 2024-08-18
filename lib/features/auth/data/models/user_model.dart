class User {
  final String? id;
  final String? username;
  final String? email;
  final String? profilePicture;

  User({
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
}