import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/arriving/arriving_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/header_container.dart';

class ArrivingScreen extends StatelessWidget {
  ArrivingScreen({Key? key}) : super(key: key);
  final ArrivingController _con = Get.put(ArrivingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "arriving".tr,
        back: true,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: _con.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    onTap: (position) {},
                    onCameraMove: (position) {},
                    markers: _con.markers,
                    // mapType: _con.currentMapType,
                    onMapCreated: _con.onMapCreated,
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(22.307159, 73.181221
                            // _con.locationData!.latitude!,
                            // _con.locationData!.longitude!,
                            ),
                        zoom: 11),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DraggableScrollableSheet(
              expand: true,
              initialChildSize: .5,
              minChildSize: .5,
              maxChildSize: .9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                scrollController.addListener(() {
                  if (scrollController.position.maxScrollExtent == 0.0) {
                    _con.isExpand.value = true;
                  } else {
                    _con.isExpand.value = false;
                  }
                });
                return ListView.builder(
                  itemCount: 1,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          headerContainer(),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "arriving".tr,
                                style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "5 min",
                                style: TextStyle(
                                  color: AppColors.textGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.03),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 5,
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              ImageConstant.profileImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -5,
                                      right: -5,
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 3,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                ImageConstant.profileImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "joesmith".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textBlackColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "skodaoctavia".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textGreyColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppColors.appColor,
                                        ),
                                        Text(
                                          "  4.3",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.textBlackColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.lightBlue,
                                      ),
                                      child: Text(
                                        "22 A 228 10",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textBlueColor,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () => _con.isExpand.value
                                ? Column(
                                    children: [
                                      const SizedBox(height: 30),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "whereareyou".tr,
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .textGreyColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Studio 08 Jake Stream",
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .textBlackColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Expanded(
                                                      child: DottedLine(
                                                        direction:
                                                            Axis.horizontal,
                                                        lineLength:
                                                            double.infinity,
                                                        lineThickness: 1.0,
                                                        dashLength: 6.0,
                                                        dashColor:
                                                            Color(0xffE0E4F5),
                                                        dashRadius: 0.0,
                                                        dashGapLength: 3.0,
                                                        dashGapColor:
                                                            Colors.transparent,
                                                        dashGapRadius: 0.0,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            AppColors.lightBlue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Image.asset(
                                                          ImageConstant
                                                              .floatingicon,
                                                          color: AppColors
                                                              .appIconColor,
                                                        ),
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
                                                        color: AppColors
                                                            .textGreyColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(AppRoutes
                                                            .selectAddressScreen);
                                                      },
                                                      child: Text(
                                                        "Studio 08 Jake Stream",
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .textBlackColor,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                      const SizedBox(height: 30),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 70,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 2,
                                            )),
                                        child: Text(
                                          "price".tr,
                                          style: TextStyle(
                                              color: AppColors.appIconColor,
                                              fontSize: 12),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Text(
                                          "\$ 892",
                                          style: TextStyle(
                                            color: Color(0xff3E4958),
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Container(),
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              contact(
                                func: () {},
                                image: ImageConstant.cancell,
                                bgColor: AppColors.lightBlue,
                                iconColor: AppColors.appIconColor,
                              ),
                              const SizedBox(width: 20),
                              contact(
                                func: () {},
                                image: ImageConstant.message,
                                bgColor: AppColors.appColor,
                                iconColor: AppColors.textBlackColor,
                              ),
                              const SizedBox(width: 20),
                              contact(
                                func: () {},
                                image: ImageConstant.call2,
                                bgColor: AppColors.appColor,
                                iconColor: AppColors.textBlackColor,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget contact({
    required String image,
    required Function() func,
    required Color iconColor,
    required Color bgColor,
  }) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(
            image,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
