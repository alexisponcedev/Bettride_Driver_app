import 'dart:async';

import 'package:taxi_booking/core/Common/commons.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/model/verfiy_otp_model.dart';

import '../../../data/api_interface.dart';
import '../../../model/register_api_model.dart';

class EnterOtpScreenController extends GetxController {
  String OTP = "";
  Timer? timer;
  RxInt start = 59.obs;

  verfiy_otp_model? resposeData;
  RxBool apiLoading = false.obs;
  RxBool emailOTP = false.obs;
  register_api_model? registerResposeData;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  verifyOTP() async {
    apiLoading.value = true;
    try {
      await ApiInterface()
          .verifyOtp(registerResposeData!.data!.token!, OTP)
          .then((value) {
        if (value == null) {
          Get.snackbar("Soryy!!".tr, 'something_wrong'.tr,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          resposeData = value;
          if (resposeData!.code == 200) {
            Common.Authorization = resposeData!.data!.accessToken;
            print("Authorization:${Common.Authorization}");
            Get.toNamed(AppRoutes.documentUplaodScreen);
          } else {
            Get.snackbar("Soryy!!".tr, resposeData!.message!,
                snackPosition: SnackPosition.BOTTOM);
          }
        }

        apiLoading.value = false;
      });
    } catch (e) {
      apiLoading.value = false;
      Get.snackbar("Soryy!!".tr, 'something_wrong'.tr,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
