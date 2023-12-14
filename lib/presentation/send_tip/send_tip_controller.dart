import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

class SendTipController extends GetxController {
  Rx<TextEditingController> myController = TextEditingController(text: "0").obs;
}
