import 'package:taxi_booking/localization/en.dart';
import 'package:taxi_booking/localization/hi.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('en');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'english'.tr,
    'hindi'.tr,
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en'),
    const Locale('hi'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enTranslation,
        'hi': hiTranslation,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
