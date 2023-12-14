import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

import '../utils/app_color.dart';

class nextButtonWidget extends StatelessWidget {
  nextButtonWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.loading,
      required this.onTap});

  final double height;
  final double width;
  bool loading;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.06,
        width: width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.primaryColor),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: AppColors.textWhiteColor,
                )
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 25,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
