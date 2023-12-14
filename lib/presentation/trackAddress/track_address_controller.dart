import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/app_constants.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';

class TrackAddressController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isSelect = (-1).obs;
  List<geo.Placemark>? destinationPlace;
  MapType currentMapType = MapType.terrain;
  TextEditingController destinationPlaceController = TextEditingController();
  // Completer<GoogleMapController> googlecontroller = Completer();
  late GoogleMapController? googlecontroller;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  LatLng? deslatlng;
  Set<Marker> markers = {};

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(appConstants.mapStyle);
    controller.setMapStyle(appConstants.mapStyle);
    googlecontroller = controller;

    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId('userLocation'),
        position: LatLng(
          locationData!.latitude!,
          locationData!.longitude!,
        ),
        infoWindow: InfoWindow(title: 'Your Location'),
      ),
    );
    // animateCar();
    // Set the state to trigger a redraw of the markers
    update();
    // googlecontroller.complete(controller);
  }

  List list = [
    {
      "image": ImageConstant.location,
      "title": "New Trip",
      "subtext": "Tap for location",
    },
    {
      "image": ImageConstant.activehome,
      "title": "Home",
      "subtext": "24km, 39 min",
    },
    {
      "image": ImageConstant.work,
      "title": "Work",
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

    PermissionStatus? _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
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
    deslatlng = LatLng(locationData!.latitude!, locationData!.longitude!);
    destinationPlace = await appConstants.getLocationName(
        locationData!.latitude!, locationData!.longitude!);
    destinationPlaceController.text = destinationPlace![0].name.toString() +
        " " +
        destinationPlace![0].locality.toString();
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
                    "Allow your location",
                    style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "We will need your location to give you better experience",
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
                    text: "Not now",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppButton(
                    text: "Ok Sure",
                  )
                ],
              ),
            ),
          );
        });
  }
}
