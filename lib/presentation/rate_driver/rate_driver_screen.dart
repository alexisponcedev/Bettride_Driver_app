import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/driver_details_screen.dart';
import 'package:taxi_booking/presentation/commonWidgets/header_container.dart';
import 'package:taxi_booking/presentation/commonWidgets/rating_bar.dart';

class RateDriverScreen extends StatelessWidget {
  const RateDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "ratedriver".tr,
        back: true,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.mapbg),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headerContainer(),
                  const SizedBox(height: 15),
                  driverDetail(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "thankyou".tr,
                    style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "pleaserateyourtrip".tr,
                    style: TextStyle(
                      color: AppColors.textGreyColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StarRating(
                        starCount: 5,
                        color: AppColors.appColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey Joe!",
                          style: TextStyle(
                            color: AppColors.textBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "writeyourmessagehere".tr,
                            hintStyle: TextStyle(
                              color: AppColors.textGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      FlutterSwitch(
                        height: 30,
                        width: 50,
                        padding: 4,
                        toggleSize: 20,
                        value: false,
                        activeSwitchBorder: Border.all(
                          color: AppColors.appColor,
                          width: 5,
                        ),
                        inactiveSwitchBorder: Border.all(
                          color: AppColors.appIconColor,
                          width: 5,
                        ),
                        toggleColor: Colors.white,
                        activeToggleColor: Colors.white,
                        activeColor: AppColors.appColor,
                        inactiveColor: Colors.white,
                        inactiveToggleColor: AppColors.appIconColor,
                        onToggle: (val) {
                          // _con.isDark.value = val;
                          // if (val == true) {
                          //   Get.changeThemeMode(ThemeMode.dark);
                          // } else {
                          //   Get.changeThemeMode(ThemeMode.light);
                          // }
                        },
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "shareyourmessagewithothertaxipassenger".tr,
                          style: TextStyle(
                            color: AppColors.textBlackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.0,
                        child: Stack(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: const Color(0xff4B545A),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                  image: DecorationImage(
                                    image:
                                        AssetImage(ImageConstant.profileImage),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Positioned(
                              left: 15,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: const Color(0xff4B545A),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          ImageConstant.profileImage),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Positioned(
                              left: 30,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: const Color(0xff4B545A),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          ImageConstant.profileImage),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Positioned(
                              left: 45,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: const Color(0xff4B545A),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          ImageConstant.profileImage),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  AppButton(text: "next".tr),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
