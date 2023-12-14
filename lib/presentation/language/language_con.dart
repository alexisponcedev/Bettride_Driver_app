import 'package:taxi_booking/core/app_export.dart';

class LanguageController extends GetxController {
  RxString lang = LocalizationService.langs.first.obs;
}
