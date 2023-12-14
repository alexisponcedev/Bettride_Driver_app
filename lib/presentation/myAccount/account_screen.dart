import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/myAccount/account_controller.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({Key? key}) : super(key: key);
  final MyAccountController _con = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: AppColors.lightBlue,
      appBar: appBar(
        text: "account".tr,
        back: false,
        backColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.editAccountScreen);
                },
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            ImageConstant.profileImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Joe Smith",
                          style: TextStyle(
                            color: AppColors.textBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "+91 (987) 555-0123",
                          style: TextStyle(
                            color: AppColors.textGreyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "personalinformation".tr,
                  style: TextStyle(
                    color: AppColors.textGreyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _con.accountList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 1) {
                        Get.toNamed(AppRoutes.paymentScreen);
                      }
                      if (index == 3) {
                        Get.toNamed(AppRoutes.faqScreen);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(15),
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: AppColors.lightappColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              _con.accountList[index]["image"],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            _con.accountList[index]["text"],
                            style: TextStyle(
                              color: AppColors.textBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          index == 4
                              ? FlutterSwitch(
                                  height: 30,
                                  width: 50,
                                  padding: 8,
                                  toggleSize: 20,
                                  value: true,
                                  toggleColor: Colors.white,
                                  activeToggleColor: Colors.white,
                                  activeColor: AppColors.appColor,
                                  inactiveColor:
                                      const Color(0xff626BFF).withOpacity(.2),
                                  onToggle: (val) {
                                    // _con.isDark.value = val;
                                    // if (val == true) {
                                    //   Get.changeThemeMode(ThemeMode.dark);
                                    // } else {
                                    //   Get.changeThemeMode(ThemeMode.light);
                                    // }
                                  },
                                )
                              : Image.asset(
                                  ImageConstant.right,
                                  height: 15,
                                  width: 15,
                                )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
