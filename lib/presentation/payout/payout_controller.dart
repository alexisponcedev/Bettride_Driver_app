import 'package:taxi_booking/core/app_export.dart';

class PayoutController extends GetxController {
  List tabs = ['online'.tr, "cash".tr];
  RxInt selectedTabIndex = 0.obs;
  RxInt paymentIndex = 0.obs;

  List paymentMethodList = [
    {
      "image": ImageConstant.bank,
      "name": "bankaccount".tr,
    },
    {
      "image": ImageConstant.mastarcard,
      "name": "**** **** **** 2453",
    },
  ];

  RxString promo = "".obs;
  RxString promoError = "".obs;

  bool valid() {
    RxBool isValid = true.obs;
    promoError.value = '';

    if (promo.value.isEmpty) {
      promoError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    }

    return isValid.value;
  }

  promoCode() {
    if (valid()) {
      Get.offAndToNamed(AppRoutes.thankyouScreen);
    } else {}
  }
}
