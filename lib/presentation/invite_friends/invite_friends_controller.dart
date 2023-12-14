import 'package:taxi_booking/core/app_export.dart';

class InviteFriendController extends GetxController {
  RxString link = "".obs;
  RxString linkError = "".obs;

  bool valid() {
    RxBool isValid = true.obs;
    linkError.value = '';

    if (link.value.isEmpty) {
      linkError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    }

    return isValid.value;
  }

  inviteFriend() {
    if (valid()) {
      Get.offAndToNamed(AppRoutes.rewardScreen);
    } else {}
  }
}
