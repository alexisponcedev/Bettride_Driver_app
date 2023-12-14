import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/header_container.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        backgroundColor: Colors.transparent,
        text: "selectaddress".tr,
        back: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.mapbg),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: Get.height - kToolbarHeight - 70,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    headerContainer(),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColors.lightBlue, width: 3),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Center(
                                child: Image.asset(
                                  ImageConstant.distance,
                                  height: 100,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "pickuppoint".tr,
                                          style: TextStyle(
                                            color: AppColors.textGreyColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          "Studio 08 Jake Stream",
                                          style: TextStyle(
                                            color: AppColors.textBlackColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(
                                          child: DottedLine(
                                            direction: Axis.horizontal,
                                            lineLength: double.infinity,
                                            lineThickness: 1.0,
                                            dashLength: 6.0,
                                            dashColor: Color(0xffE0E4F5),
                                            dashRadius: 0.0,
                                            dashGapLength: 3.0,
                                            dashGapColor: Colors.transparent,
                                            dashGapRadius: 0.0,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: AppColors.appColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Icon(
                                            Icons.my_location,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "pickoff".tr,
                                          style: TextStyle(
                                            color: AppColors.textGreyColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes.selectAddressScreen);
                                          },
                                          child: Text(
                                            "whereyouwanttogo".tr,
                                            style: TextStyle(
                                              color: AppColors.textBlackColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.bookmark,
                            color: AppColors.appColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "savedplaces".tr,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textBlackColor,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.favoritePlaceScreen);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                ImageConstant.right,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColors.lightBlue, width: 3),
                      ),
                      child: Column(
                        children: [
                          savedPlace(
                            image: ImageConstant.work,
                            address: "Studio 08 Jake Stream",
                            duration: "(10 min, 2.9 km)",
                            place: "work".tr,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            child: DottedLine(
                              direction: Axis.horizontal,
                              lineLength: double.infinity,
                              lineThickness: 1.0,
                              dashLength: 6.0,
                              dashColor: Color(0xffE0E4F5),
                              dashRadius: 0.0,
                              dashGapLength: 3.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                          ),
                          savedPlace(
                            image: ImageConstant.home,
                            address: "705 Green Summit",
                            duration: "(10 min, 2.9 km)",
                            place: "home".tr,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: Text(
                        "recent".tr,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGreyColor,
                        ),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageConstant.location,
                                color: AppColors.appIconColor,
                                height: 25,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                "Studio 65Murphy Islands",
                                style: TextStyle(
                                  color: Color(0xff4B545A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row savedPlace({
    required String image,
    required String place,
    required String address,
    required String duration,
  }) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 27,
          width: 27,
          color: AppColors.appIconColor,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  place,
                  style: TextStyle(
                    color: AppColors.textBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  duration,
                  style: TextStyle(
                    color: AppColors.textGreyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Text(
              address,
              style: const TextStyle(
                color: Color(0xff4B545A),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Spacer(),
        Image.asset(
          ImageConstant.edit,
          height: 27,
          width: 27,
          color: AppColors.appIconColor,
        ),
      ],
    );
  }
}
