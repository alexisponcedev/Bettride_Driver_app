import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taxi_booking/core/Common/commons.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/app_constants.dart';
import 'package:taxi_booking/presentation/Messages/messages_screen.dart';
import 'package:taxi_booking/presentation/bottomBar/bottombar_controller.dart';
import 'package:taxi_booking/presentation/choose_trip/choose_trip_screen.dart';
import 'package:taxi_booking/presentation/history/history_screen.dart';
import 'package:taxi_booking/presentation/home/home_screen.dart';
import 'package:taxi_booking/presentation/myAccount/account_screen.dart';

import '../../data/api_interface.dart';
import '../no_internet/no_internet_screen.dart';

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final BottomBarController _con = Get.put(BottomBarController());
  @override
  void initState() {
    // TODO: implement initState
    getMarker();
    _con.ping =
        Timer.periodic(const Duration(seconds: 5), (Timer t) => pingCall());
    super.initState();
  }

  pingCall() async {
    int code = await ApiInterface().ping();
    if (code == 400 && _con.internet == true) {
      _con.internet = false;
      Get.to(() => const NoInternetConnectionScreen());

      Common().showToast(const Icon(Icons.wifi_off_rounded),
          "Please check your internet connection", const Duration(days: 2));
    } else if (code == 200 && _con.internet == false) {
      _con.internet = true;
    }
  }

  getMarker() async {
    appConstants.bikeMarker = await appConstants.getBytesFromAsset(
        'assets/images/bikemarker.png', 80);
    appConstants.pinMarker = await appConstants.getBytesFromAsset(
        'assets/images/pinlocation.png', 120);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _con.ping!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        drawer: drawerOpen(),
        key: _con.scaffoldKey,
        body: _con.pageIndex.value == 0
            ? HomeScreen()
            : _con.pageIndex.value == 1
                ? HistoryScreen()
                : _con.pageIndex.value == 2
                    ? MessageScreen()
                    : _con.pageIndex.value == 3
                        ? MyAccountScreen()
                        : _con.pageIndex.value == 4
                            ? ChooseTripScreen()
                            : HomeScreen(),
        // floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0 ||
        //         _con.pageIndex.value == 4
        //     ? floationButton()
        //     : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottombar(),
      ),
    );
  }

  floationButton() {
    return FloatingActionButton(
      backgroundColor: AppColors.appColor,
      onPressed: () => _con.onTap(4),
      child: Ink(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          ImageConstant.floatingicon,
          height: 25,
        ),
      ),
    );
  }

  bottombar() {
    return Container(
      height: 110,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BottomAppBar(
        color: Colors.white,
        notchMargin: 12,
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _con.icons.length,
            (index) => Obx(
              () => Padding(
                padding: EdgeInsets.only(
                  left: index == 2 ? 30 : 10,
                  right: index == 1 ? 30 : 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => _con.onTap(index),
                      icon: Image.asset(
                        _con.pageIndex.value == index
                            ? _con.icons[index][1]
                            : _con.icons[index][0],
                        height: 25,
                      ),
                    ),
                    _con.pageIndex.value == index
                        ? Container(
                            height: 10,
                            width: 5,
                            decoration: BoxDecoration(
                              color: AppColors.textBlackColor,
                              shape: BoxShape.circle,
                            ),
                          )
                        : const SizedBox(height: 0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  drawerOpen() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Drawer(
          backgroundColor: const Color(0xffFFF3C9),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.09),
                  Row(
                    children: [
                      Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white,
                            width: 5,
                          ),
                          image: DecorationImage(
                            image: AssetImage(ImageConstant.profileImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dianna Smiley",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textBlackColor,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "+91 987 555-0123",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGreyColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _con.drawerItemList.length,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemBuilder: (context, index) {
                        return Obx(
                          () => GestureDetector(
                            onTap: () {
                              _con.drawerIndex.value = index;
                              if (_con.drawerIndex.value == 1) {
                                Get.offAndToNamed(
                                    AppRoutes.paymentHistoryScreen);
                              }
                              if (_con.drawerIndex.value == 2) {
                                Get.offAndToNamed(AppRoutes.payoutScreen);
                              }
                              if (_con.drawerIndex.value == 4) {
                                Get.offAndToNamed(AppRoutes.settingScreen);
                              }
                              if (_con.drawerIndex.value == 5) {
                                Get.offAndToNamed(AppRoutes.inviteFriendScreen);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              width: Get.width / 2,
                              decoration: BoxDecoration(
                                color: _con.drawerIndex.value == index
                                    ? AppColors.appColor
                                    : const Color(0xffFFF8DF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: _con.drawerIndex.value == index
                                            ? AppColors.appColor
                                            : Colors.white),
                                    child: Image.asset(
                                      _con.drawerItemList[index]["logo"],
                                      color: AppColors.textBlackColor,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    _con.drawerItemList[index]["name"],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.textBlackColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  index == 0
                                      ? Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text("\$29",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors
                                                      .textBlackColor)),
                                        )
                                      : Container(),
                                  Image.asset(
                                    ImageConstant.right,
                                    height: 12,
                                    color: _con.drawerIndex.value == index
                                        ? AppColors.textBlackColor
                                        : AppColors.appIconColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  SizedBox(height: Get.height * 0.03),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: -25,
          top: 40,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xffFFF3C9),
                width: 6,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.close,
                color: AppColors.appIconColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
