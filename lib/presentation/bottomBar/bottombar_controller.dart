import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/Messages/messages_screen.dart';
import 'package:taxi_booking/presentation/history/history_screen.dart';
import 'package:taxi_booking/presentation/home/home_screen.dart';
import 'package:taxi_booking/presentation/myAccount/account_screen.dart';
import 'package:taxi_booking/presentation/trackAddress/track_address_screen.dart';

class BottomBarController extends GetxController {
  RxInt pageIndex = Get.arguments != null && Get.arguments is int
      ? RxInt(Get.arguments)
      : 0.obs;
  RxInt drawerIndex = 0.obs;
  Timer? ping;
  FToast? fToast;
  bool internet = true;
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  List drawerItemList = [
    {
      "logo": ImageConstant.wallet1,
      "name": "Wallet",
    },
    {
      "logo": ImageConstant.backup,
      "name": "History",
    },
    {
      "logo": ImageConstant.payment,
      "name": "Payment",
    },
    {
      "logo": ImageConstant.floatingicon,
      "name": "Become a Driver",
    },
    {
      "logo": ImageConstant.setting,
      "name": "Settings",
    },
    {
      "logo": ImageConstant.invite,
      "name": "Invite Friends",
    },
  ];
  List icons = [
    [ImageConstant.home, ImageConstant.activehome],
    [ImageConstant.history, ImageConstant.activehistory],
    [ImageConstant.message, ImageConstant.activemessage],
    [ImageConstant.account, ImageConstant.activeaccount]
  ];
  onTap(int index) {
    pageIndex.value = index;
    switch (index) {
      case 0:
        HomeScreen();
        break;
      case 1:
        HistoryScreen();
        break;
      case 2:
        MessageScreen();

        break;
      case 3:
        MyAccountScreen();
        break;
      case 4:
        TrackAddressScreen();
        break;
      default:
    }
  }
}
