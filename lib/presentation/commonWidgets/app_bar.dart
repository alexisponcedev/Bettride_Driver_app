import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

AppBar appBar({
  Function()? onPressed,
  String? text,
  bool? back,
  bool? action = false,
  Color? backgroundColor,
  Color? backColor,
}) =>
    AppBar(
      backgroundColor: backgroundColor ?? AppColors.lightBlue,
      elevation: 0,
      leading: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: backColor ?? Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              constraints: const BoxConstraints(),
              icon: Image.asset(
                ImageConstant.back,
                color: back == true
                    ? AppColors.textBlackColor
                    : Colors.transparent,
                height: 15,
              ),
              onPressed: back == false ? null : () => Get.back(),
            ),
          ),
        ],
      ),
      centerTitle: true,
      title: Text(
        text!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textBlackColor,
        ),
      ),
      actions: [
        if (action!)
          CircleAvatar(
            backgroundColor: AppColors.lightBlue,
            child: IconButton(
              icon: Icon(
                Icons.settings,
                color: AppColors.cyanColor,
              ),
              onPressed: () {},
              // onPressed: () => Get.toNamed(AppRoutes.loginscreen),
            ),
          ),
        const SizedBox(
          width: 15,
        )
      ],
    );
