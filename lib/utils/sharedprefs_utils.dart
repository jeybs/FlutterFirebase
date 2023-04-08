import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {

  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
  SharedPreferences? prefs;

  SharedPrefsUtils() {
    setInstance();
  }

  void setInstance() async {
    prefs = await sharedPreferences;
  }

  saveDeviceId(String deviceId) {
    prefs?.setString("device_id", deviceId);
  }

  String? getDeviceId() {
    return prefs!.getString('device_id');
  }

}
