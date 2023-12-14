import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/choose_trip/choose_trip_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/header_container.dart';

class ChooseTripScreen extends StatefulWidget {
  ChooseTripScreen({Key? key}) : super(key: key);

  @override
  State<ChooseTripScreen> createState() => _ChooseTripScreenState();
}

class _ChooseTripScreenState extends State<ChooseTripScreen> {
  final ChooseTripController _con = Get.put(ChooseTripController());
  String? _mapStyle;
  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        backgroundColor: Colors.transparent,
        text: "chooseatrip".tr,
        back: true,
      ),
      extendBodyBehindAppBar: true,
      body: Obx(
        () => Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: _con.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      onTap: (position) {
                        _con.customInfoWindowController.hideInfoWindow!();
                      },
                      onCameraMove: (position) {
                        _con.customInfoWindowController.onCameraMove!();
                      },
                      markers: _con.markers,
                      // mapType: _con.currentMapType,
                      onMapCreated: _con.onMapCreated,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                            22.307159, 73.181221,
                            //_con.locationData!.latitude!,
                            //_con.locationData!.longitude!,
                          ),
                          zoom: 11),
                    ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    headerContainer(),
                    const SizedBox(height: 15),
                    Text(
                      "selectcar".tr,
                      style: TextStyle(
                        color: AppColors.textBlackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        _con.selectList.length,
                        (index) => Obx(
                          () => GestureDetector(
                            onTap: () {
                              _con.isSelect.value = index;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                color: _con.isSelect.value == index
                                    ? AppColors.appColor
                                    : null,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    _con.selectList[index]["icon"],
                                    height: 25,
                                    width: 25,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    _con.selectList[index]["name"],
                                    style: TextStyle(
                                      color: AppColors.textBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "${_con.selectList[index]["nearbie"]} nearbie"
                                        .tr,
                                    style: TextStyle(
                                      color: AppColors.textGreyColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: _con.isSelect.value == index
                                          ? null
                                          : AppColors.lightBlue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "\$",
                                        style: TextStyle(
                                          color: _con.isSelect.value == index
                                              ? Colors.black
                                              : AppColors.textBlueColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: _con.selectList[index]
                                                ["doller"],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                            ),
                                          ),
                                          TextSpan(
                                            text: _con.selectList[index]
                                                ["sent"],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: AppColors.lightBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            ImageConstant.history,
                            color: AppColors.appIconColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AppButton(
                            text: "booknow".tr,
                            onPressed: () {
                              Get.toNamed(AppRoutes.searchingDriverScreen);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 140,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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
}
