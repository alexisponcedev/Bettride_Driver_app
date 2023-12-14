import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

import '../../core/widgets/continue_btn_widget.dart';
import '../../data/api_interface.dart';
import '../splash/splash_screen.dart';

class NoInternetConnectionScreen extends StatefulWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  _NoInternetConnectionScreenState createState() =>
      _NoInternetConnectionScreenState();
}

class _NoInternetConnectionScreenState
    extends State<NoInternetConnectionScreen> {
  bool internet = false;
  bool server = false;
  bool audiosubs = false;
  Timer? ping;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer t) => pingCall());
  }

  pingCall() async {
    int code = await ApiInterface().ping();
    print('code$code');
    if (code == 400) {
      setState(() {
        internet = false;
      });
    } else if (code == 200) {
      if (mounted) {
        setState(() {
          internet = true;
        });
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    ping!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/no-signal.png', height: 200, width: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(
                'internet_problem'.tr,
                style: TextStyle(
                    fontSize: 15.0,
                    color: AppColors.jetBlackColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            if (internet)
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Text(
                  'back_online'.tr,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: AppColors.jetBlackColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            if (internet)
              Container(
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
                child: ContinueButton(() {
                  Get.offAll(() => SplashScreen());
                }, text: 'Refresh'.tr),
              ),
          ],
        ),
      ),
    );
  }
}
