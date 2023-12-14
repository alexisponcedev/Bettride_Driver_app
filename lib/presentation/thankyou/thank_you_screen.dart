import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/bottomBar/bottombar_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';

class ThankyouScreen extends StatelessWidget {
  ThankyouScreen({Key? key}) : super(key: key);
  final BottomBarController _con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              text: "confirm".tr,
              onPressed: () {
                Get.back();
                Get.back();
                _con.pageIndex.value = 0;
              },
            ),
            SizedBox(height: Get.height * .2),
          ],
        ),
      ),
    );
  }
}
