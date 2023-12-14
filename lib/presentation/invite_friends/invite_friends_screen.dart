import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text_field.dart';
import 'package:taxi_booking/presentation/invite_friends/invite_friends_controller.dart';

class InviteFriendScreen extends StatelessWidget {
  InviteFriendScreen({Key? key}) : super(key: key);
  final InviteFriendController _con = Get.put(InviteFriendController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "invitefriends".tr,
        back: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstant.inviteFriend,
              height: Get.height * .3,
            ),
            SizedBox(height: Get.height * .02),
            Text(
              "invitefriends".tr,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Get.height * .01),
            Text(
              "whenyourfrindssignupwithyourlinkyou’llbothgetcharge".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: Get.height * .05),
            AppTextField(
              hintText: "link".tr,
              obsecureText: true,
              onChange: (val) {
                _con.link.value = val;
              },
              errorMessage: _con.linkError,
              prefixIcon: ImageConstant.link,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(ImageConstant.copy),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * .02),
            AppButton(
              text: "invitefriends".tr,
              onPressed: () {
                _con.inviteFriend();
              },
            ),
          ],
        ),
      ),
    );
  }
}
