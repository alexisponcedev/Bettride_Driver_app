import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking/core/Common/commons.dart';
import 'package:taxi_booking/core/app_export.dart';

import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  @override
  void initState() {
    // TODO: implement initState
    getToken();
    getDeviseData();
    super.initState();
  }

  getDeviseData() async {
    if (Platform.isAndroid) {
      Common.androidInfo = await deviceInfoPlugin.androidInfo;
      print('Running on ${Common.androidInfo}');
    } else {
      Common.iosInfo = await deviceInfoPlugin.iosInfo;
      print('Running on ${Common.iosInfo}');
    }
  }

  getToken() async {
    Common.fcmToken = await FirebaseMessaging.instance.getToken();
    print("fcm:${Common.fcmToken.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    Get.put(
      SplashController(),
    );
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                ImageConstant.appIcon,
              ),
            ),
            Text(
              "Version : 1.0",
              style: TextStyle(
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
