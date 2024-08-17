import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  final SharedPreferences _sharedPreferences;

  StorageManager(this._sharedPreferences);


  String authToken = 'auth_token';

  Future<void> saveToken(String value) async {
    await _sharedPreferences.setString(authToken, value);
  }

  String? getToken() {
    return _sharedPreferences.getString(authToken);
  }

}