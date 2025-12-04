import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesModule {
  @preResolve
  @singleton
  Future<SharedPreferences> provideSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }
}

@singleton
class SharedPrefHelper {
  final SharedPreferences _prefs;

  SharedPrefHelper(this._prefs);

  SharedPreferences get instance => _prefs;

    /// Set any supported type
    Future<void> setValue(String key, dynamic value) async {
      if (value is String) {
        await _prefs.setString(key, value);
      } else if (value is int) {
        await _prefs.setInt(key, value);
      } else if (value is double) {
        await _prefs.setDouble(key, value);
      } else if (value is bool) {
        await _prefs.setBool(key, value);
      } else {
        throw Exception('Unsupported value type');
      }
    }

    /// Get any value
    dynamic getValue(String key) {
      return _prefs.get(key);
    }

    /// Remove a specific key
    Future<void> remove(String key) async {
      await _prefs.remove(key);
    }

    /// Clear all stored data
    Future<void> clear() async {
      await _prefs.clear();
    }
  }
