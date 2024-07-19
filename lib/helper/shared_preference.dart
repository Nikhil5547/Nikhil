import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferencesService?> getInstance() async {
    _instance ??= SharedPreferencesService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  //user Id
  static String get getUserId {
    return _preferences?.getString(SharedPreferenceEnum.userId.key) ?? '';
  }

  Future<void> saveUserID(String userId) async {
    try {
      await _preferences?.setString(SharedPreferenceEnum.userId.key, userId);
    } catch (e) {
      log('userID $e');
    }
  }

  //username
  static String get getFirstname {
    return _preferences?.getString(SharedPreferenceEnum.firstName.key) ?? '';
  }

  Future<void> saveFirstName(String value) async {
    try {
      await _preferences?.setString(SharedPreferenceEnum.firstName.key, value);
    } catch (e) {
      log('userID $e');
    }
  }

  static String get getEmail {
    return _preferences?.getString(SharedPreferenceEnum.email.key) ?? '';
  }

  Future<void> saveEmail(String value) async {
    try {
      await _preferences?.setString(SharedPreferenceEnum.email.key, value);
    } catch (e) {
      log('authToken $e');
    }
  }

  static Future<void> clearAll() async {
    await _preferences?.clear();
  }
}

enum SharedPreferenceEnum {
  userId('userId'),
  authToken('authToken'),
  firstName('firstName'),
  email('email');

  const SharedPreferenceEnum(this.key);

  final String key;
}