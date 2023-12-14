import '/core/app_export.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.wellcomeScreen);
    });
    super.onInit();
  }
}
