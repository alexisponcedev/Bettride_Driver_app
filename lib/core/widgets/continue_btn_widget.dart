import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

class ContinueButton extends StatelessWidget {
  final Function onTap;
  final String? text;

  ContinueButton(this.onTap, {this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        margin: EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(25)),
        child: Text("Continue",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textWhiteColor)),
      ),
    );
  }
}
