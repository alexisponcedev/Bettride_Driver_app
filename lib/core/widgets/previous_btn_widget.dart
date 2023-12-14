import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class PreviousButtonWidget extends StatelessWidget {
  PreviousButtonWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.onTap});

  final double height;
  final double width;
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
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
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
