import 'package:equatable/equatable.dart';

class LikeResponse extends Equatable{
  final String? message;
  final int? likes;

  const LikeResponse({
    this.message,
    this.likes,
  });

  factory LikeResponse.fromJson(Map<String, dynamic> json) => LikeResponse(
    message: json["message"],
    likes: json["likes"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "likes": likes,
  };

  @override
  List<Object?> get props => [message, likes];
}
