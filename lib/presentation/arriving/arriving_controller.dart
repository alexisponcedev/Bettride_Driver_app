import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/app_constants.dart';

class ArrivingController extends GetxController {
  RxBool isExpand = false.obs;
  RxBool isLoading = false.obs;

  MapType currentMapType = MapType.normal;

  Completer<GoogleMapController> googlecontroller = Completer();

  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  Set<Marker> markers = {};

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(appConstants.mapStyle);
    googlecontroller.complete(controller);
  }

  // @override
  // void onInit() {
  //   print('object');
  //   getLocation();
  //   super.onInit();
  // }

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
}
