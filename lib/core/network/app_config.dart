abstract class AppConfig {
  static const String baseUrl = 'http://localhost:3000/api';

  static const String register = '$baseUrl/users/register';
  static const String login = '$baseUrl/users/login';

  static String fetchUser(String id) => "$baseUrl/users/$id";
  static String toggleFollow(String id) => "$baseUrl/user/toggleFollow/$id";
  static String fetchComment(String id) => "$baseUrl/posts/$id/comment";
  static String toggleLike(String id) => "$baseUrl/posts/$id/toggleLike";
  static String fetchPosts(int page,String? userId) => "$baseUrl/posts/?page=$page&userId=$userId";


}
