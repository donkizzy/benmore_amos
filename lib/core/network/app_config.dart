abstract class AppConfig {
  static const String baseUrl = 'http://localhost:3000/api';

  static const String register = '$baseUrl/users/register';
  static const String login = '$baseUrl/users/login';

  static String saveLocationInfo(String id) => "$baseUrl/api/v1/user-destinations/$id";


}
