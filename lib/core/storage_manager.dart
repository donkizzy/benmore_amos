import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  final SharedPreferences _sharedPreferences;

  StorageManager(this._sharedPreferences);


  String authToken = 'auth_token';
  String userId = 'user_id';

  Future<void> saveToken(String value) async {
    await _sharedPreferences.setString(authToken, value);
  }

  Future<void> saveUserId(String value) async {
    await _sharedPreferences.setString(userId, value);
  }

  String? getToken() {
    return _sharedPreferences.getString(authToken);
  }
  String? getUserId() {
    return _sharedPreferences.getString(userId);
  }


  void clearAll() {
    _sharedPreferences.clear();
  }

}