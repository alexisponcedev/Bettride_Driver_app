import 'package:taxi_booking/core/app_export.dart';

class PayTipController extends GetxController {
  RxInt isTip = 0.obs;
  List tipList = [
    {"tip": "\$5"},
    {"tip": "\$10"},
    {"tip": "\$15"},
    {"tip": "\$20"},
  ];
}
