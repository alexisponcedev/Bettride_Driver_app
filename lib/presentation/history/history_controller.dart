import 'package:taxi_booking/core/app_export.dart';

class HistoryController extends GetxController {
  // RxBool isExpanded = false.obs;
  // RxInt isselect = 0.obs;
  RxList isselect = RxList([]);

  List tabs = ['list'.tr, "map".tr];
  RxInt selectedTabIndex = 0.obs;
}
