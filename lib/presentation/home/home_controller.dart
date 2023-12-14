import 'dart:developer' as d;
import 'dart:math';
import 'dart:ui';

import 'package:clippy_flutter/triangle.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/app_constants.dart';
import 'package:taxi_booking/data/api_interface.dart';
import 'package:taxi_booking/model/driver_online_status_model.dart';
import 'package:taxi_booking/presentation/bottomBar/bottombar_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isSelect = (-1).obs;
  RxBool onlineStatus = false.obs;
  final BottomBarController controller = Get.find();
  LatLng deslatlng = const LatLng(33.71, 72.76);
  LatLng? sourceLatLng;
//add your lat and lng where you wants to draw polyline
  List<LatLng> latlng = [];
  LatLng? _carLocation;
  List<geo.Placemark>? sourcePlace;
  TextEditingController sourcePlaceController = TextEditingController();
  driverOnlineStatusModel? onlineStatusData;
// latlng.add(_new);
// latlng.add(_news);
  // MapType currentMapType = MapType.terrain;

  late GoogleMapController googlecontroller;

  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  RxSet<Marker> markers = <Marker>{}.obs;
  Marker? _carMarker;
  Marker? _locationMarker;
  double distanceBetween(
      double startLat, double startLng, double endLat, double endLng) {
    const int earthRadius = 6371000;
    double latDiff = (endLat - startLat) * (3.141592653589793 / 180);
    double lngDiff = (endLng - startLng) * (3.141592653589793 / 180);
    double a = (sin(latDiff / 2) * sin(latDiff / 2)) +
        (cos(startLat * (3.141592653589793 / 180)) *
            cos(endLat * (3.141592653589793 / 180)) *
            sin(lngDiff / 2) *
            sin(lngDiff / 2));
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  changeOnlineStatus() async {
    try {
      onlineStatusData = await ApiInterface()
          .chnangeOnlineStatus(onlineStatus.value ? "1" : "0");
      if (onlineStatusData != null) {
        if (kDebugMode) {
          print("onlineStatusrespose:${onlineStatusData!.message!}");
        }
      } else {}
    } catch (e) {}
  }

  Future<void> animateCar() async {
    double totalDuration = 10.0;
    double interval = 0.1;
    double distance = distanceBetween(locationData!.latitude!,
        locationData!.longitude!, deslatlng.latitude, deslatlng.longitude);
    double speed = distance / totalDuration;

    double t = 0.0;
    while (t < 1.0) {
      t += interval / totalDuration;
      if (t > 1.0) {
        t = 1.0;
      }

      double? lat = lerpDouble(locationData!.latitude!, deslatlng.latitude, t);
      double? lng =
          lerpDouble(locationData!.longitude!, deslatlng.longitude, t);

      _carLocation = LatLng(lat!, lng!);

      _carMarker = Marker(
          markerId: const MarkerId("userLocation"),
          position: _carLocation!,
          icon: appConstants.bikeMarker == null
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
              : BitmapDescriptor.fromBytes(appConstants.bikeMarker!));

      markers.clear();
      markers.add(_carMarker!);
      d.log(markers.length.toString());
      await Future.delayed(const Duration(milliseconds: 1));
      googlecontroller.animateCamera(CameraUpdate.newLatLng(_carLocation!));
    }
  }

  Set<Polyline> polylines = {
    const Polyline(
      polylineId: PolylineId('route'),
      points: [
        LatLng(33.6938, 73.0551), // Faisal Mosque
        LatLng(33.6930, 73.0551), // Pakistan Monument
        LatLng(33.7279, 73.0787), // Daman-e-Koh
        LatLng(33.6939, 73.0479), // Centaurus Mall
        LatLng(33.6665, 73.0533)
      ],
      color: Colors.blue,
      width: 5,
    ),
  };

  // void _drawPolyline(List<LatLng> points) {
  //   mapController.addPolyline(Polyline(
  //     polylineId: PolylineId('route'),
  //     points: points,
  //     color: Colors.blue,
  //     width: 5,
  //   ));
  // }
  addCustomTag(BuildContext context) {
    customInfoWindowController.addInfoWindow!(
      Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.textWhiteColor,
                borderRadius: BorderRadius.circular(4),
              ),
              width: double.infinity,
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("2",
                            style: TextStyle(
                                color: AppColors.textWhiteColor,
                                fontWeight: FontWeight.bold)),
                        Text("MIN",
                            style: TextStyle(
                                color: AppColors.textWhiteColor,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Home",
                          style: TextStyle(
                              color: AppColors.jetBlackColor,
                              fontWeight: FontWeight.w600)),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                  const SizedBox()
                ],
              ),
            ),
          ),
          Triangle.isosceles(
            edge: Edge.BOTTOM,
            child: Container(
              color: Colors.blue,
              width: 20.0,
              height: 10.0,
            ),
          ),
        ],
      ),
      sourceLatLng!,
    );
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(appConstants.mapStyle);
    googlecontroller = controller;
    googlecontroller.showMarkerInfoWindow(const MarkerId("userLocation"));
    markers.clear();
    customInfoWindowController.googleMapController = controller;
    markers.add(
      Marker(
          markerId: const MarkerId('userLocation'),
          position: LatLng(
            locationData!.latitude!,
            locationData!.longitude!,
          ),
          icon: appConstants.pinMarker == null
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
              : BitmapDescriptor.fromBytes(appConstants.pinMarker!)),
    );
    // animateCar();
    // Set the state to trigger a redraw of the markers
    update();
  }

  List list = [
    {
      "image": ImageConstant.location,
      "title": "newtrip".tr,
      "subtext": "tapforlocation".tr,
    },
    {
      "image": ImageConstant.activehome,
      "title": "home".tr,
      "subtext": "24km, 39 min",
    },
    {
      "image": ImageConstant.work,
      "title": "work".tr,
      "subtext": "14km, 15 min",
    }
  ];

  @override
  void onInit() {
    if (kDebugMode) {
      print('object');
    }
    getLocation();
    super.onInit();
  }

  Location location = Location();
  bool? _serviceEnabled = false;
  LocationData? locationData;
  getLocation() async {
    isLoading.value = true;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    PermissionStatus? permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await Location().getLocation();
    if (kDebugMode) {
      print(locationData);
    }
    isLoading.value = false;
    if (kDebugMode) {
      print("=======================================");
    }
    if (kDebugMode) {
      print("-=-=-=-=--=-=-=-=-");
      print(locationData!.latitude);
      print(locationData!.longitude);
    }
    sourceLatLng = LatLng(locationData!.latitude!, locationData!.longitude!);
    sourcePlace = await appConstants.getLocationName(
        locationData!.latitude!, locationData!.longitude!);
    await ApiInterface().updateDeviceInfo(locationData!.latitude!.toString(),
        locationData!.longitude!.toString());
    sourcePlaceController.text =
        "${sourcePlace![0].name} ${sourcePlace![0].locality}";

    markers.add(
      Marker(
        markerId: const MarkerId('userLocation'),
        position: LatLng(
          locationData!.latitude!,
          locationData!.longitude!,
        ),
      ),
    );

    // Set the state to trigger a redraw of the markers
    update();
  }

  void selectLocation(context) async {
    bottomSheet(context);
  }

  Future<dynamic> bottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(25),
            topStart: Radius.circular(25),
          ),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 7,
                    width: 70,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "allowyourlocation".tr,
                    style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "wewillneedyourlocationtogiveyoubetterexperience".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppButton(
                    color: AppColors.lightBlue,
                    text: "notnow".tr,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppButton(
                    text: "oksure".tr,
                    onPressed: () {
                      Get.toNamed(AppRoutes.trackAddressScreen);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
