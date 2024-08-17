class Following {
  final String? id;
  final String? username;
  final String? email;

  Following({
    this.id,
    this.username,
    this.email,
  });

  factory Following.fromJson(Map<String, dynamic> json) => Following(
    id: json["id"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
  };
}