import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHydratedStorage implements Storage {
  late final SharedPreferences _preferences;

  SharedPreferencesHydratedStorage(this._preferences);

  static Future<SharedPreferencesHydratedStorage> getInstance() async {
    final preferences = await SharedPreferences.getInstance();
    return SharedPreferencesHydratedStorage(preferences);
  }

  @override
  dynamic read(String key) {
    final jsonString = _preferences.getString(key);
    return jsonString != null ? jsonDecode(jsonString) : null;
  }

  @override
  // ignore: avoid_annotating_with_dynamic
  Future<void> write(String key, dynamic value) async {
    if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is List<String>) {
      await _preferences.setStringList(key, value);
    } else if (value is Map<String, dynamic>) {
      final jsonString = json.encode(value);
      await _preferences.setString(key, jsonString);
    } else {
      throw UnsupportedError('Unsupported value type');
    }
  }

  @override
  Future<void> delete(String key) async {
    await _preferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await _preferences.clear();
  }

  @override
  Future<void> close() async {
    await _preferences.clear();
  }
}
