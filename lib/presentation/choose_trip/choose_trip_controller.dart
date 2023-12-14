import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/app_constants.dart';

class ChooseTripController extends GetxController {
  RxBool isLoading = false.obs;
  MapType currentMapType = MapType.normal;
  RxInt isSelect = 0.obs;

  Completer<GoogleMapController> googlecontroller = Completer();

  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  Set<Marker> markers = {};

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(appConstants.mapStyle);
    googlecontroller.complete(controller);
  }

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

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    PermissionStatus? _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  List selectList = [
    {
      "icon": ImageConstant.bike,
      "name": "bike".tr,
      "nearbie": "5",
      "doller": "5",
      "sent": "63"
    },
    {
      "icon": ImageConstant.standard,
      "name": "standard".tr,
      "nearbie": "2",
      "doller": "8",
      "sent": "92"
    },
    {
      "icon": ImageConstant.permium,
      "name": "permium".tr,
      "nearbie": "1",
      "doller": "9",
      "sent": "46"
    }
  ];
}
