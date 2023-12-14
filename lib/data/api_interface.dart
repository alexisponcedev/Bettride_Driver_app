import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';

import '../core/Common/commons.dart';
import '../model/devise_info_data_model.dart';
import '../model/driver_online_status_model.dart';
import '../model/register_api_model.dart';
import '../model/upload_temp_file_model.dart';
import '../model/verfiy_otp_model.dart';

class ApiInterface extends GetConnect {
  Future<int> ping() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return 200;
      } else {
        return 400;
      }
    } on SocketException catch (_) {
      return 400;
    }
  }

  Future<register_api_model?> register(
      String name,
      String email,
      String countryCode,
      String phone,
      String city,
      String gender,
      String dob) async {
    register_api_model? data;
    // PackageInfo package = await PackageInfo.fromPlatform();
    var formData = FormData({
      "name": name,
      'email': email,
      'countryCode': countryCode,
      'phoneNumber': phone.replaceAll(' ', ''),
      'dob': dob,
      'city': city,
      'gender': gender
    });
    try {
      var response = await post("${Common.baseurl}register", formData);

      print('Status COde recieved = ${response.statusCode}');
      print('response recieved = ${response.bodyString}');
      if (response.statusCode == 200) {
        data = register_api_model.fromJson(response.body);
      } else {
        data = null;
      }
    } catch (e) {
      data = null;
    }
    return data;
  }

  Future<verfiy_otp_model?> verifyOtp(
    String token,
    String otp,
  ) async {
    verfiy_otp_model? data;
    // PackageInfo package = await PackageInfo.fromPlatform();
    var formData = FormData({
      "token": token,
      'otp': otp,
    });
    try {
      var response = await post(
        "${Common.baseurl}verify-otp", formData,
        // headers: {
        //   'Authorization':""
        // },
      );

      print('Status COde recieved = ${response.statusCode}');
      print('response recieved = ${response.bodyString}');
      if (response.statusCode == 200) {
        data = verfiy_otp_model.fromJson(jsonDecode(response.bodyString!));
      } else {
        data = null;
      }
    } catch (e) {
      data = null;
    }
    return data;
  }

  Future<driverOnlineStatusModel?> chnangeOnlineStatus(String status) async {
    driverOnlineStatusModel? data;
    // PackageInfo package = await PackageInfo.fromPlatform();
    var formData = FormData({
      "status": status,
    });
    try {
      var response = await post(
        "${Common.baseurl}change-driver-online-status",
        formData,
        headers: {'Authorization': Common.Authorization!},
      );

      if (response.statusCode == 200) {
        data =
            driverOnlineStatusModel.fromJson(jsonDecode(response.bodyString!));
      } else {
        data = null;
      }
    } catch (e) {
      data = null;
    }
    return data;
  }

  Future<deviseInfoStatusModel?> updateDeviceInfo(
    String latitude,
    String longitude,
  ) async {
    deviseInfoStatusModel? data;
    // PackageInfo package = await PackageInfo.fromPlatform();
    var formData = FormData({
      "device_id": Common.androidInfo!.id.toString(),
      "device_type": Platform.isAndroid ? "Android" : "IOS",
      "device_agent": Common.androidInfo!.manufacturer,
      "device_agent_version": Common.androidInfo!.version.release,
      "device_agent_raw": Common.androidInfo,
      "latitude": latitude,
      "longitude": longitude,
      "fcm_token": Common.fcmToken,
    });
    try {
      var response = await post(
        "${Common.baseurl}device-info",
        formData,
        headers: {'Authorization': Common.Authorization!},
      );

      if (response.statusCode == 200) {
        log("Device data uploaded");
      } else {
        data = null;
      }
    } catch (e) {
      data = null;
    }
    return data;
  }

  Future<uploadTempFileModel?> uploadTempFile(
    String type,
    List<int> image,
  ) async {
    uploadTempFileModel? data;
    // PackageInfo package = await PackageInfo.fromPlatform();
    var formData = FormData({
      'type': type,
      'file': MultipartFile(image, filename: 'file.png'),
    });
    try {
      var response = await post(
        "${Common.baseurl}upload-to-temp",
        formData,
        headers: {'Authorization': Common.Authorization!},
      );
      log("Status COde:${response.statusCode}");

      if (response.statusCode == 200) {
        log("iside 200");
        data = uploadTempFileModel.fromJson(jsonDecode(response.bodyString!));
      } else {
        data = null;
      }
    } catch (e) {
      data = null;
    }
    return data;
  }

  Future<int?> uploadDriverInfo(
    String type,
    String data,
  ) async {
    // PackageInfo package = await PackageInfo.fromPlatform();
    var formData = FormData({'types': type, 'data': data});
    try {
      var response = await post(
        "${Common.baseurl}upload-driver-info",
        formData,
        headers: {'Authorization': Common.Authorization!},
      );
      log("Status COde:${response.statusCode}");

      if (response.statusCode == 200) {
        log("iside 200");
        return 200;
      } else {
        return 400;
      }
    } catch (e) {
      return 400;
    }
  }
}
