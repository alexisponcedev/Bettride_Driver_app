import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/bottomBar/bottombar_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final BottomBarController _con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "settings".tr, back: true),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "personalinformation".tr,
                  style: TextStyle(
                    color: AppColors.textGreyColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
              settingList(
                icon: ImageConstant.profile,
                name: "myprofile".tr,
                ontap: () {
                  Get.back();
                  _con.pageIndex.value = 3;
                },
              ),
              settingList(
                icon: ImageConstant.location,
                name: "location".tr,
                ontap: () {},
              ),
              settingList(
                icon: ImageConstant.payment,
                name: "payment".tr,
                ontap: () {
                  Get.toNamed(AppRoutes.paymentScreen);
                },
              ),
              settingList(
                icon: ImageConstant.information,
                name: "inforamtion".tr,
                ontap: () {},
              ),
              settingList(
                icon: ImageConstant.backup,
                name: "history".tr,
                ontap: () {
                  Get.toNamed(AppRoutes.rideHistoryScreen);
                },
              ),
              settingList(
                icon: ImageConstant.key,
                name: "changepassword".tr,
                ontap: () {
                  Get.toNamed(AppRoutes.changePasswordScreen);
                },
              ),
              settingList(
                icon: ImageConstant.notification,
                name: "notifications".tr,
                ontap: () {
                  Get.toNamed(AppRoutes.notificationScreen);
                },
              ),
              settingList(
                icon: ImageConstant.faq,
                name: "faq".tr,
                ontap: () {
                  Get.toNamed(AppRoutes.faqScreen);
                },
              ),
              settingList(
                icon: ImageConstant.faq,
                name: "languages".tr,
                ontap: () {
                  Get.toNamed(AppRoutes.languageListScreen);
                },
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }

  Widget settingList(
      {bool isSwitch = false,
      required String icon,
      required String name,
      required Function() ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.lightappColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(icon),
            ),
            const SizedBox(width: 20),
            Text(
              name,
              style: TextStyle(
                color: AppColors.textBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            isSwitch == false
                ? Image.asset(
                    ImageConstant.right,
                    height: 15,
                    width: 15,
                  )
                : FlutterSwitch(
                    height: 30,
                    width: 50,
                    padding: 8,
                    toggleSize: 20,
                    value: true,
                    toggleColor: Colors.white,
                    activeToggleColor: Colors.white,
                    activeColor: AppColors.appColor,
                    inactiveColor: const Color(0xff626BFF).withOpacity(.2),
                    onToggle: (val) {
                      // _con.isDark.value = val;
                      // if (val == true) {
                      //   Get.changeThemeMode(ThemeMode.dark);
                      // } else {
                      //   Get.changeThemeMode(ThemeMode.light);
                      // }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
