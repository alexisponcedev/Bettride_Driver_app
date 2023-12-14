import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_booking/core/app_export.dart';

import '../../../../core/Common/commons.dart';
import '../../../../data/api_interface.dart';
import '../../../../model/upload_temp_file_model.dart';

class UploadBikeDataController extends GetxController {
  TextEditingController regNumController = TextEditingController();

  RxString bikeFrontImage = "".obs;
  RxString bikeBackImage = "".obs;
  RxBool isBikeFrontLoading = false.obs;
  RxBool isBikeBackLoading = false.obs;
  List<String> nameList = [
    "",
    "",
  ];
  Rx<Color> bikeColor = const Color(0x00000fff).obs;
  showColorPicker(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Pick a color"),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: const Color(0xff443a49),
                paletteType: PaletteType.hueWheel,
                onColorChanged: (value) {
                  bikeColor.value = value;
                },
              ),
            ),
          );
        });
  }

  TextEditingController bikeModel = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  Future<String?> onCameraClick(upladedPersonalImages type) async {
    uploadTempFileModel? responseData;
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

            XFile? image =
                await imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              if (type == upladedPersonalImages.bikeFront) {
                bikeFrontImage.value = image.path.toString();
                Uint8List img = File(bikeFrontImage.value).readAsBytesSync();
                responseData = await ApiInterface().uploadTempFile("RPI", img);
                if (responseData == null) {
                  bikeFrontImage.value = "";
                  isBikeFrontLoading.value = false;
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  if (responseData!.code == 200) {
                    isBikeFrontLoading.value = false;
                    nameList[0] = responseData!.data!.name!;
                  } else {
                    isBikeFrontLoading.value = false;
                    bikeFrontImage.value = "";
                    Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                }
              } else if (type == upladedPersonalImages.bikeBack) {
                bikeBackImage.value = image.path.toString();
                Uint8List img = File(bikeBackImage.value).readAsBytesSync();
                responseData = await ApiInterface().uploadTempFile("DLFI", img);
                if (responseData == null) {
                  bikeBackImage.value = "";
                  isBikeBackLoading.value = false;
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  if (responseData!.code == 200) {
                    isBikeBackLoading.value = false;
                    nameList[1] = responseData!.data!.name!;
                    log(responseData!.data!.name.toString());
                  } else {
                    isBikeBackLoading.value = false;
                    bikeBackImage.value = "";
                    Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                }
                bikeBackImage.value = image.path.toString();
              }
            }
          },
          child: Text('Choose from gallery'.tr),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: false,
          onPressed: () async {
            Get.back();
            XFile? image =
                await imagePicker.pickImage(source: ImageSource.camera);
            if (image != null) {
              if (type == upladedPersonalImages.bikeFront) {
                bikeFrontImage.value = image.path.toString();
                Uint8List img = File(bikeFrontImage.value).readAsBytesSync();
                responseData = await ApiInterface().uploadTempFile("RPI", img);
                if (responseData == null) {
                  bikeFrontImage.value = "";
                  isBikeFrontLoading.value = false;
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  if (responseData!.code == 200) {
                    isBikeFrontLoading.value = false;
                  } else {
                    isBikeFrontLoading.value = false;
                    bikeFrontImage.value = "";
                    Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                }
              } else if (type == upladedPersonalImages.bikeBack) {
                bikeBackImage.value = image.path.toString();
                Uint8List img = File(bikeBackImage.value).readAsBytesSync();
                responseData = await ApiInterface().uploadTempFile("DLFI", img);
                if (responseData == null) {
                  bikeBackImage.value = "";
                  isBikeBackLoading.value = false;
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  if (responseData!.code == 200) {
                    isBikeBackLoading.value = false;
                    log(responseData!.data!.name.toString());
                  } else {
                    isBikeBackLoading.value = false;
                    bikeBackImage.value = "";
                    Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                }
                bikeBackImage.value = image.path.toString();
              }
            }
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
