import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/helper.dart';

class VerifyPhoneNumberController extends GetxController {
  TextEditingController phoneController = TextEditingController(text: "");
  Rx<Map?> productCondition = Rx(null);
  RxString phoneNoError = ''.obs;

  String generateFlagEmojiUnicode(String countryCode) {
    return countryCode.codeUnits
        .map((e) => String.fromCharCode(127397 + e))
        .toList()
        .reduce((value, element) => value + element)
        .toString();
  }

  String generatecode(String countryCode) {
    return countryCode.codeUnits
        .map((e) => String.fromCharCode(e))
        .toList()
        .reduce((value, element) => value + element)
        .toString();
  }

  bool valid() {
    RxBool isValid = true.obs;

    phoneNoError.value = '';

    if (phoneController.text.isEmpty) {
      phoneNoError.value = "pleaseentervalidmobilenumber".tr;
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phoneController.text)) {
      phoneNoError.value = "pleaseentervalidmobilenumber".tr;
      isValid.value = false;
    }

    return isValid.value;
  }

  verifyPhoneNumber() {
    if (valid()) {
      Get.toNamed(AppRoutes.verificationCodeScreen);
    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
