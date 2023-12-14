import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_booking/core/Common/commons.dart';
import 'package:taxi_booking/data/api_interface.dart';

import '../../../../model/upload_temp_file_model.dart';

class UploadBikePersonalController extends GetxController {
  TextEditingController IDNumController = TextEditingController();
  RxString ProfileImage = "".obs;
  RxString licenseBackImage = "".obs;
  RxString licenseFrontImage = "".obs;
  RxBool isProfileLoading = false.obs;
  RxBool isLicenceFrontLoading = false.obs;
  RxBool isLicenceBackLoading = false.obs;
  List<String> nameList = ["", "", ""];
  final ImagePicker imagePicker = ImagePicker();

  Future<String> getName(String path) async {
    // Use the split() method to split the string by "/"
    List<String> parts = path.split("/");

    String lastPart = parts.last;
    return lastPart;
  }

  Future<String?> onCameraClick(upladedPersonalImages type) async {
    final action = CupertinoActionSheet(
      message: Text(
        'Add picture'.tr,
        style: const TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: false,
          onPressed: () async {
            Get.back();
            uploadTempFileModel? responseData;
            XFile? image =
                await imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              if (type == upladedPersonalImages.profile) {
                ProfileImage.value = image.path.toString();
                Uint8List img = File(ProfileImage.value).readAsBytesSync();
                responseData = await ApiInterface().uploadTempFile("RPI", img);
                if (responseData == null) {
                  ProfileImage.value = "";
                  isProfileLoading.value = false;
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  if (responseData.code == 200) {
                    isProfileLoading.value = false;
                    nameList[0] = responseData.data!.name!;
                    log(nameList.toString());
                  } else {
                    isProfileLoading.value = false;
                    ProfileImage.value = "";
                    Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                }
              } else if (type == upladedPersonalImages.licenseFront) {
                licenseFrontImage.value = image.path.toString();
                Uint8List img = File(licenseFrontImage.value).readAsBytesSync();
                responseData = await ApiInterface().uploadTempFile("DLFI", img);
                if (responseData == null) {
                  licenseFrontImage.value = "";
                  isLicenceFrontLoading.value = false;
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  if (responseData.code == 200) {
                    isLicenceFrontLoading.value = false;
                    log(responseData.data!.name.toString());
                    nameList[1] = responseData.data!.name!;
                    log(nameList.toString());
                  } else {
                    isLicenceFrontLoading.value = false;
                    licenseFrontImage.value = "";
                    Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                }
                licenseFrontImage.value = image.path.toString();
              } else {
                licenseBackImage.value = image.path.toString();
                Uint8List img = File(licenseBackImage.value).readAsBytesSync();
                responseData = await ApiInterface().uploadTempFile("DLFI", img);
                if (responseData == null) {
                  licenseBackImage.value = "";
                  isLicenceBackLoading.value = false;
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  if (responseData.code == 200) {
                    isLicenceBackLoading.value = false;
                    log(responseData.data!.name.toString());
                    nameList[2] = responseData.data!.name!;
                    log(nameList.toString());
                  } else {
                    isLicenceBackLoading.value = false;
                    licenseBackImage.value = "";
                    Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                }
                licenseBackImage.value = image.path.toString();
              }
            }
          },
          child: Text('Choose from gallery'.tr),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            XFile? image =
                await imagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              type == upladedPersonalImages.profile
                  ? ProfileImage.value = image.path.toString()
                  : type == upladedPersonalImages.licenseFront
                      ? licenseFrontImage.value = image.path.toString()
                      : licenseBackImage.value = image.path.toString();
            }
            Get.back();
          },
          child: Text('Take a picture'.tr),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text('cancel'.tr),
        onPressed: () {
          Get.back();
        },
      ),
    );
    showCupertinoModalPopup(
        context: Get.context!, builder: (context) => action);
    return null;
  }
}
