import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  // Private static instance
  static final SharedPrefHelper _instance = SharedPrefHelper._internal();

  // Instance of SharedPreferences
  late SharedPreferences _prefs;

  // Private constructor
  SharedPrefHelper._internal();

  // Factory constructor to return the singleton instance
  factory SharedPrefHelper() => _instance;

  /// Initialize SharedPreferences
  static Future<void> init() async {
    _instance._prefs = await SharedPreferences.getInstance();
  }

  /// Removes a value from SharedPreferences with given [key].
  Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper: data with key: $key has been removed');
    await _prefs.remove(key);
  }

  Future<void> setData(String key, dynamic value) async {
    debugPrint("SharedPrefHelper: setData with key: $key and value: $value");
    switch (value.runtimeType) {
      case String:
        await _prefs.setString(key, value as String);
        break;
      case int:
        await _prefs.setInt(key, value as int);
        break;
      case bool:
        await _prefs.setBool(key, value as bool);
        break;
      case double:
        await _prefs.setDouble(key, value as double);
        break;
      default:
        throw UnsupportedError("Unsupported data type for SharedPreferences.");
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  bool getBool(String key, {bool fallback = false}) {
    debugPrint('SharedPrefHelper: getBool with key: $key');
    return _prefs.getBool(key) ?? fallback;
  }

  /// Gets a double value from SharedPreferences with given [key].
  double getDouble(String key, {double fallback = 0.0}) {
    debugPrint('SharedPrefHelper: getDouble with key: $key');
    return _prefs.getDouble(key) ?? fallback;
  }

  /// Gets an int value from SharedPreferences with given [key].
  int getInt(String key, {int fallback = 0}) {
    debugPrint('SharedPrefHelper: getInt with key: $key');
    return _prefs.getInt(key) ?? fallback;
  }

  /// Gets an String value from SharedPreferences with given [key].
  String getString(String key, {String fallback = ''}) {
    debugPrint('SharedPrefHelper: getString with key: $key');
    return _prefs.getString(key) ?? fallback;
  }
}
