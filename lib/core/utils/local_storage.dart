import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import 'app_prefs.dart';

class LocalStorage {
  static String userId = "";
  static String deviceIP = "";
  static String token = "";
  static String userEmail = "";
  static String firstName = "";
  static String lastName = "";
  static String userMobile = "";
  static String userProfile = "";
  static String deviceId = "";
  static String deviceToken = "";
  static String deviceType = "";
  static bool isLogin = false;

  static void storeDataInfo(json) async {
    if (kDebugMode) {
      print(json['access_token']);
    }
    final prefs = GetStorage();
    //* Store Token
    prefs.write(Prefs.token, json['access_token']);
    //* Store UserId
    // prefs.write(Prefs.USER_ID, json['data']['id'].toString());
    // //* Store firstName
    // prefs.write(Prefs.FIRST_NAME, json['data']['first_name']);
    // //* Store lastName
    // prefs.write(Prefs.LAST_NAME, json['data']['last_name']);
    // //* Store email
    // prefs.write(Prefs.USER_EMAIL, json['data']['email']);
    // //* Store mobile
    // prefs.write(Prefs.MOBILE, json['data']['mobile']);
    //* Store User Profile Image
    // prefs.write(Prefs.PROFILE_IMAGE, json['data']['profile_image']);
    //* set data
    // userId = prefs.read(Prefs.USER_ID);
    token = prefs.read(Prefs.token);
    // userEmail = prefs.read(Prefs.USER_EMAIL);
    // firstName = prefs.read(Prefs.FIRST_NAME);
    // lastName = prefs.read(Prefs.LAST_NAME);
    // userMobile = prefs.read(Prefs.MOBILE);
    // userProfile = prefs.read(Prefs.PROFILE_IMAGE);
  }

  static void storeDeviceInfo(
    String deviceID,
    String deviceTOKEN,
    String deviceTYPE,
  ) async {
    final prefs = GetStorage();
    try {
      const url = 'https://api.ipify.org';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        prefs.write(Prefs.deviceIP, response.body);
        deviceIP = prefs.read(Prefs.deviceIP);
      } else {
        if (kDebugMode) {
          print(response.body);
        }
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
    //* Store device id
    prefs.write(Prefs.deviceID, deviceID);
    //* Store device token
    prefs.write(Prefs.deviceFCMtoken, deviceTOKEN);
    //* Store device type
    prefs.write(Prefs.deviceType, deviceTYPE);
    //* set data
    deviceId = prefs.read(Prefs.deviceID);
    deviceToken = prefs.read(Prefs.deviceFCMtoken);
    deviceType = prefs.read(Prefs.deviceType);
    deviceIP = prefs.read(Prefs.deviceIP);
  }
}
