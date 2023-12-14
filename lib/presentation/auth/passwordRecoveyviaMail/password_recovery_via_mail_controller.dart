import 'package:flutter/foundation.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/helper.dart';

class PasswordRecoveryController extends GetxController {
  RxString email = "".obs;
  RxString emailError = "".obs;
  bool valid() {
    RxBool isValid = true.obs;
    emailError.value = '';
    if (email.isEmpty) {
      emailError.value = "Please enter a valid email address";
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "Please enter a valid email address";
      isValid.value = false;
    }
    return isValid.value;
  }

  onForgotPassword() {
    if (valid()) {
      Get.toNamed(AppRoutes.verificationCodeScreen);
    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
