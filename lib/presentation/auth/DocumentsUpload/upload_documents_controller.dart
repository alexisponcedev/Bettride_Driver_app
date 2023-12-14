import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

class UploadDocumentsController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxInt activeStep2 = 0.obs;
  RxBool isDataUploading = false.obs;
}
