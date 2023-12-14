import 'package:flutter/foundation.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/helper.dart';

class ChangePasswordController extends GetxController {
  RxString currentPassword = "".obs;
  RxString currentPasswordError = "".obs;
  RxString newPassword = "".obs;
  RxString newPasswordError = "".obs;
  RxString confirmPassword = "".obs;
  RxString confirmPasswordError = "".obs;

  bool valid() {
    RxBool isValid = true.obs;
    currentPasswordError.value = '';
    newPasswordError.value = '';
    confirmPasswordError.value = '';

    if (currentPassword.isEmpty) {
      currentPasswordError.value = "Please enter a valid password";
      isValid.value = false;
    } else if (!Helper.isPassword(currentPassword.value)) {
      currentPasswordError.value =
          "The password must contain at least six character";
      isValid.value = false;
    }
    if (newPassword.isEmpty) {
      newPasswordError.value = "Please enter valid password";
      isValid.value = false;
    } else if (confirmPassword.isEmpty) {
      confirmPasswordError.value = "Please enter valid confirm password";
      isValid.value = false;
    } else if (newPassword != confirmPassword) {
      confirmPasswordError.value = "Password doesn't match";
      isValid.value = false;
    }
    return isValid.value;
  }

  onChangePassword() {
    if (valid()) {
      Get.back();
    } else {
      if (kDebugMode) {
        print("Not Valid");
      }
    }
  }
}
