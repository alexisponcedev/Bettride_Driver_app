import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final String? image;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final bool? border;
  final double? fs;
  final double? radius;

  const AppButton({
    Key? key,
    this.onPressed,
    this.text,
    this.height,
    this.width,
    this.color,
    this.image,
    this.border = false,
    this.textColor,
    this.iconColor,
    this.fs,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          color: color ?? AppColors.appColor,
          border: border == true ? Border.all(color: AppColors.appColor) : null,
        ),
        child: SizedBox(
          height: height ?? 60,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image != null
                  ? Image.asset(
                      image!,
                      height: 20,
                      color: iconColor ?? Colors.white,
                    )
                  : Container(),
              const SizedBox(width: 10),
              Text(
                text!,
                style: TextStyle(
                  fontSize: fs ?? 16,
                  color: textColor ?? AppColors.textWhiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
