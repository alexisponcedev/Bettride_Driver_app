import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/globle.dart';

class VerificationCodeController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  RxString email = "".obs;
  RxString otp = "".obs;

  onEnterOtp() async {
    if (otp.value.isEmpty || otp.value.length > 4) {
      toast("Please enter valid otp");
    } else {
      Get.toNamed(AppRoutes.createNewPasswordScreen);
    }
  }
}
