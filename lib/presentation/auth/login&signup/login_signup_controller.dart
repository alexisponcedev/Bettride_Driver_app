import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/helper.dart';

class LoginSignupController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TabController?> tabController = Rx(null);
  RxInt selectedIndex = 0.obs;
  RxBool termsPolicy = false.obs;

  RxString email = kDebugMode ? "gautam@gmail.com".obs : "".obs;
  RxString emailError = "".obs;
  RxString password = kDebugMode ? "gems1234".obs : "".obs;
  RxString passwordError = "".obs;
  RxString fullname = "".obs;
  RxString fullnameError = "".obs;
  RxString? phoneNumber;
  @override
  void onInit() {
    super.onInit();
    tabController = Rx(
      TabController(
        length: 2,
        vsync: this,
        initialIndex: 0,
      ),
    );

    tabController.value!.addListener(() {
      selectedIndex.value = tabController.value!.index;
    });
  }

  bool valid() {
    RxBool isValid = true.obs;
    emailError.value = '';
    passwordError.value = '';
    if (email.isEmpty) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    }
    if (password.isEmpty) {
      passwordError.value = "pleaseenteravalidpassword".tr;
      isValid.value = false;
    } else if (!Helper.isPassword(password.value)) {
      passwordError.value = "thepasswordmustcontainatleastsixcharacter".tr;
      isValid.value = false;
    }
    return isValid.value;
  }

  bool validrc() {
    RxBool isValid = true.obs;
    fullnameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    if (fullname.isEmpty) {
      fullnameError.value = "pleaseenteravalidfullname".tr;
      isValid.value = false;
    }
    if (email.isEmpty) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    }
    if (password.isEmpty) {
      passwordError.value = "pleaseenteravalidpassword".tr;
      isValid.value = false;
    } else if (!Helper.isPassword(password.value)) {
      passwordError.value = "thepasswordmustcontainatleastsixcharacter".tr;
      isValid.value = false;
    }

    return isValid.value;
  }

  login() {
    if (valid()) {
      Get.offAndToNamed(AppRoutes.bottomBarScreen);
    } else {}
  }

  signUp() {
    if (valid()) {
      Get.offAndToNamed(AppRoutes.bottomBarScreen);
    } else {}
  }
}
