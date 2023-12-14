import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

class AppStyle {
  static TextStyle textStyleregular20 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: getSize(
      20,
    ),
  );
  static LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.01, 0.7],
    colors: [
      AppColors.gradient1,
      AppColors.gradient2,
    ],
  );
}
