import 'package:taxi_booking/core/app_export.dart';

class FavoritePlaceController extends GetxController {
  RxInt isSelect = 0.obs;

  RxString place = "".obs;
  RxString placeError = "".obs;
  RxString placeAddress = "".obs;
  RxString placeAddressError = "".obs;

  List placeList = [
    {"icon": ImageConstant.home, "name": "home".tr},
    {"icon": ImageConstant.work, "name": "work".tr},
    {"icon": ImageConstant.location, "name": "other".tr}
  ];

  bool valid() {
    RxBool isValid = true.obs;
    placeError.value = '';
    placeAddressError.value = '';
    if (place.isEmpty) {
      placeError.value = "pleaseenteraplace".tr;
      isValid.value = false;
    }
    if (placeAddress.isEmpty) {
      placeAddressError.value = "pleaseenteraplaceaddress".tr;
      isValid.value = false;
    }
    return isValid.value;
  }

  favoritePlace() {
    if (valid()) {
      Get.back();
    }
  }
}
