import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/bottomBar/bottombar_controller.dart';

class CancelTripController extends GetxController {
  RxList isselect = RxList([]);
  final BottomBarController controller = Get.find();

  List cancelList = [
    {"text": "waitingforlongtime".tr},
    {"text": "wrongaddressshown".tr},
    {"text": "thepriceisnotreasonable".tr},
    {"text": "rideisn’there".tr},
    {"text": "others".tr}
  ];
}
