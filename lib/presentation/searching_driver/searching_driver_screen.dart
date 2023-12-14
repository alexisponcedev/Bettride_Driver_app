import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/searching_driver/searching_driver_controller.dart';

class SearchingDriverScreen extends StatelessWidget {
  const SearchingDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchingDriverController());
    return Scaffold(
      appBar: appBar(
        text: "searchingfordriver".tr,
        back: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(ImageConstant.appIcon),
          ),
          Column(
            children: [
              Text(
                "searchingride".tr,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                "itmaytakesometimes".tr,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height / 2.5,
                child: Image.asset(ImageConstant.circles),
              ),
              Positioned(
                bottom: Get.height / 5 - 25,
                right: Get.width / 2 - 10,
                child: Image.asset(
                  ImageConstant.car,
                  height: 50,
                ),
              ),
              Positioned(
                top: Get.height / 4 - 25,
                right: Get.width / 1.3 - 25,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.profileImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Get.height / 3.3 - 25,
                right: Get.width / 8 - 25,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.profileImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConfirmationSlider(
              width: Get.width,
              height: 60,
              backgroundColor: AppColors.appColor,
              foregroundColor: Colors.white,
              shadow: const BoxShadow(),
              sliderButtonContent: Icon(
                Icons.close,
                color: AppColors.appColor,
              ),
              onConfirmation: () {
                Get.toNamed(AppRoutes.cancelTripScreen);
              },
              backgroundShape: BorderRadius.circular(10),
              text: "slidetocancel".tr,
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
