import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/data/api_interface.dart';

import '../../../model/register_api_model.dart';

class GetUserDataController extends GetxController {
  File? pickedImage;
  final ImagePicker imagePicker = ImagePicker();
  RxString? phoneNumber;
  RxString countryCode = "92".obs;
  TextEditingController dateInput = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  register_api_model? resposeData;
  RxBool apiLoading = false.obs;
  RxInt selectedGender = 1.obs;
  registerUser() async {
    apiLoading.value = true;
    try {
      await ApiInterface()
          .register(
        nameController.text,
        emailController.text,
        countryCode.value,
        numberController.text,
        cityController.text,
        selectedGender.value.toString(),
        dateInput.text,
      )
          .then((value) {
        if (value == null) {
          Get.snackbar("Soryy!!".tr, 'something_wrong'.tr,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          resposeData = value;
          Get.toNamed(AppRoutes.otpFiledScreen,
              arguments: {"email": emailController.text, "data": resposeData});
          log(value.toString());
        }

        apiLoading.value = false;
      });
    } catch (e) {
      apiLoading.value = false;
      Get.snackbar("Soryy!!".tr, 'something_wrong'.tr,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
