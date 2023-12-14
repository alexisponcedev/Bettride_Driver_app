import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum upladedPersonalImages {
  profile,
  licenseBack,
  licenseFront,
  bikeFront,
  bikeBack,
  bcdImage,
  cardFront,
  cardBack
}

class Common {
  static String baseurl = "https://api.bettride.com/manage/v1/driver/";
  static String? fcmToken;
  static String? Authorization;
  static AndroidDeviceInfo? androidInfo;
  static IosDeviceInfo? iosInfo;
  FToast? fToast;
  showToast(Icon icon, String text, Duration duration) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(
            width: 10.0,
          ),
          Text(text),
        ],
      ),
    );

    fToast!.showToast(
        child: toast, gravity: ToastGravity.BOTTOM, toastDuration: duration);
    // fToast!.removeQueuedCustomToasts();
  }
}
