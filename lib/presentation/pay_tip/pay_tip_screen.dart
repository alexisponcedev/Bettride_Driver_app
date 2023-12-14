import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/driver_details_screen.dart';
import 'package:taxi_booking/presentation/commonWidgets/header_container.dart';
import 'package:taxi_booking/presentation/pay_tip/pay_tip_controller.dart';

class PayTipScreen extends StatelessWidget {
  PayTipScreen({Key? key}) : super(key: key);
  final PayTipController _con = Get.put(PayTipController());

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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  headerContainer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: driverDetail(),
                  ),
                  Text(
                    "wow5star".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "doyouwanttoantadditionaltipforjoesmith".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        4,
                        (index) {
                          return Obx(
                            () => GestureDetector(
                              onTap: () {
                                _con.isTip.value = index;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _con.isTip.value == index
                                      ? AppColors.appColor
                                      : AppColors.lightBlue,
                                ),
                                child: Text(
                                  _con.tipList[index]["tip"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AppButton(
                      text: "no".tr,
                      color: AppColors.lightBlue,
                    ),
                  ),
                  AppButton(
                    width: Get.width - 30,
                    text: "paytip".tr,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
