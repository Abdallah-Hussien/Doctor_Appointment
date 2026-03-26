import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  /// Save a [value] with a [key] in FlutterSecureStorage
  static setSecuredString({required String key, required String value}) async {
    const secure = FlutterSecureStorage();
        debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await secure.write(key: key, value: value);
  }

  /// Get a String value through a [key] in FlutterSecureStorage
  static getSecuredString({required String key}) async {
    const secure = FlutterSecureStorage();
        debugPrint('FlutterSecureStorage : getSecuredString with key :');

    return await secure.read(key: key) ?? '';
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
