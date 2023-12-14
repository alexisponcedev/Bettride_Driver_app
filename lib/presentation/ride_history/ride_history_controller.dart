import 'package:taxi_booking/core/app_export.dart';

class RideHistoryController extends GetxController {
  RxList isselect = RxList([]);
  List tabs = ['completed'.tr, "canceled".tr];
  RxInt selectedTabIndex = 0.obs;
}
