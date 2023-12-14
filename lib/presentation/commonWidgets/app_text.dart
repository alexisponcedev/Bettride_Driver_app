import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

Text disc(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.textBlackColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}

Text subTitle(String text) {
  return Text(
    text,
    style: TextStyle(
      color: AppColors.textBlackColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}

Text title(String text) {
  return Text(
    text,
    style: TextStyle(
      color: AppColors.textBlackColor,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
  );
}
