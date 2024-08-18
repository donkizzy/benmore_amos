class CreatePostRequest {
  final String? title;
  final String? description;

  CreatePostRequest({
    this.title,
    this.description,
  });

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) => CreatePostRequest(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}
