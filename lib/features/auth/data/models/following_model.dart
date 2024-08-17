class Following {
  final String? id;
  final String? username;
  final String? email;
  final String? profilePicture;

  Following({
    this.id,
    this.username,
    this.email,
    this.profilePicture,
  });

  factory Following.fromJson(Map<String, dynamic> json) => Following(
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