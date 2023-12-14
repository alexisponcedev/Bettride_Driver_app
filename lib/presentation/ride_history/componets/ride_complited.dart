import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

class RideComplitedScreen extends StatelessWidget {
  const RideComplitedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "thisweek".tr,
              style: TextStyle(
                color: AppColors.textGreyColor,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
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
                                ridePlace(
                                  address: "Bisupara, Bashtola 410",
                                  pick: "pickuppoint".tr,
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
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: AppColors.lightBlue,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.asset(
                                            ImageConstant.profileImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                ridePlace(
                                  address: "Beza Building, aadis 4586",
                                  pick: "pickoff".tr,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          info(
                            image: ImageConstant.distance2,
                            text: '3.1 km',
                          ),
                          _dottedline(),
                          info(
                            image: ImageConstant.time,
                            text: "8 min",
                          ),
                          _dottedline(),
                          info(
                            image: ImageConstant.money,
                            text: "\$8.92",
                          )
                        ],
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }

  SizedBox _dottedline() {
    return const SizedBox(
      height: 20,
      width: 20,
      child: DottedLine(
        direction: Axis.vertical,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 6.0,
        dashColor: Color(0xffE0E4F5),
        dashRadius: 0.0,
        dashGapLength: 3.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }

  Widget info({
    required String image,
    required String text,
  }) {
    return Expanded(
      child: Row(
        children: [
          Image.asset(
            image,
            height: 25,
            width: 25,
            color: AppColors.appIconColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textBlackColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }

  Column ridePlace({
    required String pick,
    required String address,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pick,
          style: TextStyle(
              color: AppColors.textBlueColor, fontWeight: FontWeight.w500),
        ),
        Text(
          address,
          style: TextStyle(
            color: AppColors.textBlackColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
