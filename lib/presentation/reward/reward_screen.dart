import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "reward".tr,
        back: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * .3,
              width: Get.height * .3,
              child: Image.asset(
                ImageConstant.trophy,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: Get.height * .02),
            Text(
              "congratulation".tr,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Get.height * .01),
            Text(
              "youreceivedanawardthroughyourfriendmembership".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: Get.height * .05),
            AppButton(
              text: "recive{\$20}".tr,
            ),
            SizedBox(height: Get.height * .2),
          ],
        ),
      ),
    );
  }
}
