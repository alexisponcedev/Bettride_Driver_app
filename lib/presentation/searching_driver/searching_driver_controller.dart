import 'package:taxi_booking/core/app_export.dart';

class SearchingDriverController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 10), () {
      Get.offNamed(AppRoutes.arrivingScreen);
    });
    super.onInit();
  }
}
