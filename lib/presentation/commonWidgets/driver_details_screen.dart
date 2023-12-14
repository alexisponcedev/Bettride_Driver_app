import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

Widget driverDetail() {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
    width: Get.width / 1.5,
    decoration: BoxDecoration(
      color: AppColors.appColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImageConstant.profileImage))),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Joe Smith",
                style: TextStyle(
                  color: AppColors.textBlackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Driver",
                style: TextStyle(
                  color: AppColors.textBlackColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
