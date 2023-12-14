import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/core/utils/app_color.dart';
import 'package:taxi_booking/core/widgets/next_button_widget.dart';

import '../../../routes/app_routes.dart';

class TermAndConditions extends StatelessWidget {
  const TermAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(''),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset('assets/images/contract.png')),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "privacy_title".tr,
                  style: TextStyle(
                    color: AppColors.textBlackColor.withOpacity(0.9),
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "privacy_detail".tr,
                  style: TextStyle(
                    color: AppColors.textBlackColor.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: nextButtonWidget(
            height: height,
            width: width,
            loading: false,
            onTap: () {
              Get.toNamed(AppRoutes.bottomBarScreen);
            }));
  }
}
