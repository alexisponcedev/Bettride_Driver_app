import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart' as dio;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'dart:io';

import 'package:taxi_booking/core/utils/helper.dart';

class EditAccountController extends GetxController {
  Rx<TextEditingController> fullNameController =
      TextEditingController(text: "").obs;
  Rx<TextEditingController> emailController =
      TextEditingController(text: "").obs;
  Rx<TextEditingController> passwordController =
      TextEditingController(text: "").obs;
  RxString fullNameError = "".obs;
  RxString emailError = "".obs;
  RxString passwordError = "".obs;

  RxString profileUrl = "".obs;
  Rx<File> profileImage = File("").obs;
  final ImagePicker picker = ImagePicker();
  dio.MultipartFile? multipartFile;

  bool valid() {
    RxBool isValid = true.obs;
    if (fullNameController.value.text.isEmpty) {
      fullNameError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    }

    if (emailController.value.text.isEmpty) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    } else if (!Helper.isEmail(emailController.value.text)) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    }

    if (passwordController.value.text.isEmpty) {
      passwordError.value = "pleaseenteravalidpassword".tr;
      isValid.value = false;
    } else if (!Helper.isPassword(passwordController.value.text)) {
      passwordError.value = "thepasswordmustcontainatleastsixcharacter".tr;
      isValid.value = false;
    }
    return isValid.value;
  }

  void pickProfileFile(context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text("camera".tr),
              onTap: () async {
                Get.back();
                await picImage(false);
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder),
              title: Text("gallery".tr),
              onTap: () async {
                Get.back();
                await picImage(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future picImage(bool fromGallery) async {
    XFile? pickedFile;
    try {
      pickedFile = await picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
        maxHeight: 500,
        maxWidth: 500,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 300, ratioY: 300),
        compressQuality: 50,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Edit',
            statusBarColor: AppColors.primaryColor,
            toolbarColor: AppColors.lightBlue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Edit',
          ),
        ],
      );
      if (croppedFile != null) {
        profileImage.value = File(croppedFile.path);
        if (kDebugMode) {
          print("===IMAGE SIZE==");
          print(profileImage.value.readAsBytesSync().lengthInBytes);
        }

        multipartFile = dio.MultipartFile.fromFileSync(
          File(croppedFile.path).path,
          filename: path.basename(File(croppedFile.path).path),
        );
        updateProfile();
      }
    } else {
      return;
    }
  }

  updateProfile() {
    if (valid()) {
      Get.back();
    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
