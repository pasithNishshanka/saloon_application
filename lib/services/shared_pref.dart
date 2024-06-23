import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceHelper {
  static String userIdkey = "USERKEY";
  static String userNamekey = "USERNAMEKEY";
  static String userEmailkey = "USEREMAILKEY";
  static String userImagekey = "USERIMAGEKEY";

  // Function to save a value based on the key
  Future<bool> saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  // Function to get a value based on the key
  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Convenience functions for user data
  Future<bool> saveUserId(String userId) => saveData(userIdkey, userId);
  Future<bool> saveUserName(String userName) => saveData(userNamekey, userName);
  Future<bool> saveUserEmail(String userEmail) => saveData(userEmailkey, userEmail);
  Future<bool> saveUserImage(String userImage) => saveData(userImagekey, userImage);

  Future<String?> getUserId() => getData(userIdkey);
  Future<String?> getUserName() => getData(userNamekey);
  Future<String?> getUserEmail() => getData(userEmailkey);
  Future<String?> getUserImage() => getData(userImagekey);
}