class RegisterRequest {
  final String? email;
  final String? password;
  final String? username;

  RegisterRequest({
    this.email,
    this.password,
    this.username,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
    email: json["email"],
    password: json["password"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "username": username,
  };
}
