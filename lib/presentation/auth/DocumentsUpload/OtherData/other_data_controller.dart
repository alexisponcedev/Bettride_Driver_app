import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/Common/commons.dart';
import '../../../../data/api_interface.dart';
import '../../../../model/upload_temp_file_model.dart';

class UploadOtherController extends GetxController {
  RxString cardDocumentFrontImage = "".obs;
  RxString cardDocumentBackImage = "".obs;
  RxString BCDImage = "".obs;
  RxBool iscardDocumentFrontImageLoading = false.obs;
  RxBool iscardDocumentBackImageLoading = false.obs;
  RxBool isBCDImageLoading = false.obs;
  List<String> nameList = ["", "", ""];
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
            if (type == upladedPersonalImages.cardFront) {
              cardDocumentFrontImage.value = image!.path.toString();
              Uint8List img =
                  File(cardDocumentFrontImage.value).readAsBytesSync();
              responseData = await ApiInterface().uploadTempFile("CDFI", img);
              if (responseData == null) {
                cardDocumentFrontImage.value = "";
                iscardDocumentFrontImageLoading.value = false;
                Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                    snackPosition: SnackPosition.BOTTOM);
              } else {
                if (responseData!.code == 200) {
                  iscardDocumentFrontImageLoading.value = false;
                  nameList[0] = responseData!.data!.name!;
                } else {
                  iscardDocumentFrontImageLoading.value = false;
                  cardDocumentFrontImage.value = "";
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                }
              }
            } else if (type == upladedPersonalImages.cardBack) {
              cardDocumentBackImage.value = image!.path.toString();
              Uint8List img =
                  File(cardDocumentBackImage.value).readAsBytesSync();
              responseData = await ApiInterface().uploadTempFile("CDBI", img);
              if (responseData == null) {
                cardDocumentBackImage.value = "";
                iscardDocumentBackImageLoading.value = false;
                Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                    snackPosition: SnackPosition.BOTTOM);
              } else {
                if (responseData!.code == 200) {
                  iscardDocumentBackImageLoading.value = false;
                  nameList[1] = responseData!.data!.name!;
                  log(responseData!.data!.name.toString());
                } else {
                  iscardDocumentBackImageLoading.value = false;
                  cardDocumentBackImage.value = "";
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                }
              }
              cardDocumentBackImage.value = image.path.toString();
            } else if (type == upladedPersonalImages.bcdImage) {
              BCDImage.value = image!.path.toString();
              Uint8List img = File(BCDImage.value).readAsBytesSync();
              responseData = await ApiInterface().uploadTempFile("BCD", img);
              if (responseData == null) {
                BCDImage.value = "";
                isBCDImageLoading.value = false;
                Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                    snackPosition: SnackPosition.BOTTOM);
              } else {
                if (responseData!.code == 200) {
                  isBCDImageLoading.value = false;
                  nameList[2] = responseData!.data!.name!;
                  log(responseData!.data!.name.toString());
                } else {
                  isBCDImageLoading.value = false;
                  BCDImage.value = "";
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                }
              }
              BCDImage.value = image.path.toString();
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
            if (type == upladedPersonalImages.cardFront) {
              cardDocumentFrontImage.value = image!.path.toString();
              Uint8List img =
                  File(cardDocumentFrontImage.value).readAsBytesSync();
              responseData = await ApiInterface().uploadTempFile("CDFI", img);
              if (responseData == null) {
                cardDocumentFrontImage.value = "";
                iscardDocumentFrontImageLoading.value = false;
                Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                    snackPosition: SnackPosition.BOTTOM);
              } else {
                if (responseData!.code == 200) {
                  iscardDocumentFrontImageLoading.value = false;
                  nameList[0] = responseData!.data!.name!;
                } else {
                  iscardDocumentFrontImageLoading.value = false;
                  cardDocumentFrontImage.value = "";
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                }
              }
            } else if (type == upladedPersonalImages.cardBack) {
              cardDocumentBackImage.value = image!.path.toString();
              Uint8List img =
                  File(cardDocumentBackImage.value).readAsBytesSync();
              responseData = await ApiInterface().uploadTempFile("CDBI", img);
              if (responseData == null) {
                cardDocumentBackImage.value = "";
                iscardDocumentBackImageLoading.value = false;
                Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                    snackPosition: SnackPosition.BOTTOM);
              } else {
                if (responseData!.code == 200) {
                  iscardDocumentBackImageLoading.value = false;
                  nameList[1] = responseData!.data!.name!;
                  log(responseData!.data!.name.toString());
                } else {
                  iscardDocumentBackImageLoading.value = false;
                  cardDocumentBackImage.value = "";
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                }
              }
              cardDocumentBackImage.value = image.path.toString();
            } else if (type == upladedPersonalImages.bcdImage) {
              BCDImage.value = image!.path.toString();
              Uint8List img = File(BCDImage.value).readAsBytesSync();
              responseData = await ApiInterface().uploadTempFile("BCD", img);
              if (responseData == null) {
                BCDImage.value = "";
                isBCDImageLoading.value = false;
                Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                    snackPosition: SnackPosition.BOTTOM);
              } else {
                if (responseData!.code == 200) {
                  isBCDImageLoading.value = false;
                  nameList[2] = responseData!.data!.name!;
                  log(responseData!.data!.name.toString());
                } else {
                  isBCDImageLoading.value = false;
                  BCDImage.value = "";
                  Get.snackbar("Soryy!!".tr, "Image uploading faild".tr,
                      snackPosition: SnackPosition.BOTTOM);
                }
              }
              BCDImage.value = image.path.toString();
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
