import 'dart:convert';

import 'package:realworld_flutter/common/util/dart_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static late final SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// get a json object
  static T? getJsonObject<T>(String key, T Function(Map<String, dynamic> json) transform) =>
      getString(key)?.let((it) => transform(json.decode(it)));

  /// set a json object
  static Future<bool> setJsonObject<T>(String key,  dynamic object) =>
      setString(key, json.encode(object.toJson()));

  /// get a object json map
  static Map<String, dynamic>? getJsonMap(String key) =>
      getString(key)?.let((it) => json.decode(it));

  /// set a object json map
  static Future<bool> setJsonMap(String key, Map<String, dynamic> jsonMap) => setString(key, json.encode(jsonMap));

  /// Returns all keys in the persistent storage.
  static Set<String> getKeys() => _prefs.getKeys();

  /// Reads a value of any type from persistent storage.
  static Object? get(String key) => _prefs.get(key);

  /// Reads a value from persistent storage, throwing an exception if it's not a
  /// bool.
  static bool? getBool(String key) => _prefs.getBool(key);

  /// Reads a value from persistent storage, throwing an exception if it's not
  /// an int.
  static int? getInt(String key) => _prefs.getInt(key);

  /// Reads a value from persistent storage, throwing an exception if it's not a
  /// double.
  static double? getDouble(String key) => _prefs.getDouble(key);

  /// Reads a value from persistent storage, throwing an exception if it's not a
  /// String.
  static String? getString(String key) => _prefs.getString(key);

  /// Returns true if persistent storage the contains the given [key].
  static bool containsKey(String key) => _prefs.containsKey(key);

  /// Reads a set of string values from persistent storage, throwing an
  /// exception if it's not a string set.
  static List<String>? getStringList(String key) => _prefs.getStringList(key);

  /// Saves a boolean [value] to persistent storage in the background.
  static Future<bool> setBool(String key, bool value) =>
      _prefs.setBool(key, value);

  /// Saves an integer [value] to persistent storage in the background.
  static Future<bool> setInt(String key, int value) =>
      _prefs.setInt(key, value);

  /// Saves a double [value] to persistent storage in the background.
  ///
  /// Android doesn't support storing doubles, so it will be stored as a float.
  static Future<bool> setDouble(String key, double value) =>
      _prefs.setDouble(key, value);

  /// Saves a string [value] to persistent storage in the background.
  ///
  /// Note: Due to limitations in Android's SharedPreferences,
  /// values cannot start with any one of the following:
  ///
  /// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu'
  /// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBCaWdJbnRlZ2Vy'
  /// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBEb3VibGUu'
  static Future<bool> setString(String key, String value) =>
      _prefs.setString(key, value);

  /// Saves a list of strings [value] to persistent storage in the background.
  static Future<bool> setStringList(String key, List<String> value) =>
      _prefs.setStringList(key, value);

  /// Removes an entry from persistent storage.
  static Future<bool> remove(String key) => _prefs.remove(key);

  /// Completes with true once the user preferences for the app has been cleared.
  static Future<bool> clear() => _prefs.clear();

  /// Fetches the latest values from the host platform.
  ///
  /// Use this method to observe modifications that were made in native code
  /// (without using the plugin) while the app is running.
  static Future<void> reload() => _prefs.reload();
}
