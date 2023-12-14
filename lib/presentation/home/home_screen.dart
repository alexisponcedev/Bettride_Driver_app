import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/app_constants.dart';
import 'package:taxi_booking/presentation/commonWidgets/search_box.dart';
import 'package:taxi_booking/presentation/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _con = Get.put(HomeController());
  LatLng? latLng;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _appbar(),
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
                      onTap: (argument) async {
                        _con.googlecontroller.animateCamera(
                            CameraUpdate.newLatLng(
                                LatLng(argument.latitude, argument.longitude)));
                        _con.sourceLatLng =
                            LatLng(argument.latitude, argument.longitude);
                        _con.markers.clear();
                        _con.markers.add(
                          Marker(
                              markerId: const MarkerId('userLocation'),
                              position:
                                  LatLng(argument.latitude, argument.longitude),
                              icon: appConstants.bikeMarker == null
                                  ? BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueAzure)
                                  : BitmapDescriptor.fromBytes(
                                      appConstants.pinMarker!)),
                        );
                        _con.sourcePlace = await appConstants.getLocationName(
                            argument.latitude, argument.longitude);
                        _con.sourcePlaceController.text =
                            "${_con.sourcePlace![0].name} ${_con.sourcePlace![0].locality}";
                        setState(() {});
                      },
                      onCameraMove: (position) async {
                        _con.sourceLatLng = LatLng(position.target.latitude,
                            position.target.longitude);
                        _con.markers.clear();
                        _con.addCustomTag(context);
                        _con.markers.add(
                          Marker(
                            icon: appConstants.bikeMarker == null
                                ? BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueAzure)
                                : BitmapDescriptor.fromBytes(
                                    appConstants.pinMarker!,
                                  ),
                            markerId: const MarkerId('userLocation'),
                            position: LatLng(position.target.latitude,
                                position.target.longitude),
                            // infoWindow: InfoWindow(title: 'Your Location'),
                            onTap: () {
                              _con.addCustomTag(context);
                            },
                          ),
                        );

                        _con.customInfoWindowController.onCameraMove!();
                      },
                      onCameraIdle: () async {
                        _con.sourcePlace = await appConstants.getLocationName(
                          _con.sourceLatLng!.latitude,
                          _con.sourceLatLng!.longitude,
                        );
                        _con.sourcePlaceController.text =
                            "${_con.sourcePlace![0].name} ${_con.sourcePlace![0].locality}";
                        setState(() {});
                      },
                      markers: _con.markers.value,
                      polylines: _con.polylines,
                      onMapCreated: _con.onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          _con.locationData!.latitude!,
                          _con.locationData!.longitude!,
                        ),
                        zoom: 11,
                      ),
                    ),
            ),
            CustomInfoWindow(
              controller: _con.customInfoWindowController,
              height: 60,
              width: 140,
              offset: 50,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: Get.height / 2.3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 7,
                      width: 70,
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "whereto".tr,
                            style: TextStyle(
                              color: AppColors.textBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "customize".tr,
                            style: TextStyle(
                              color: AppColors.textGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(left: 15),
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  _con.isSelect.value = index;
                                  _con.selectLocation(context);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(6),
                                  height: Get.height * .16,
                                  width: Get.height * .16,
                                  decoration: BoxDecoration(
                                    color: _con.isSelect.value == index
                                        ? AppColors.appColor
                                        : AppColors.lightBlue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(7),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: _con.isSelect.value == index
                                              ? Colors.white
                                              : AppColors.appColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                            _con.list[index]["image"]),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        _con.list[index]["title"],
                                        style: TextStyle(
                                          color: AppColors.textBlackColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        _con.list[index]["subtext"],
                                        style: TextStyle(
                                          color: _con.isSelect.value == index
                                              ? Colors.black.withOpacity(.7)
                                              : AppColors.textGreyColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      toolbarHeight: 70,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              _con.controller.openDrawer();
            },
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  ImageConstant.profileImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: searchBox(
              controller: _con.sourcePlaceController,
              hint: "search".tr,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(ImageConstant.search),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Obx(
          () => CupertinoSwitch(
            value: _con.onlineStatus.value,
            onChanged: (value) {
              _con.onlineStatus.value = value;
              _con.changeOnlineStatus();
            },
            thumbColor: AppColors.textWhiteColor,
            activeColor: AppColors.primaryColor,
            trackColor: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
