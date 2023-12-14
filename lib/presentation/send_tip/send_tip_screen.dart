import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/driver_details_screen.dart';
import 'package:taxi_booking/presentation/commonWidgets/header_container.dart';
import 'package:taxi_booking/presentation/send_tip/send_tip_controller.dart';

import 'num_pad.dart';

class SendTipScreen extends StatelessWidget {
  SendTipScreen({Key? key}) : super(key: key);
  final SendTipController _con = Get.put(SendTipController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "sendtip".tr,
        back: true,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.mapbg),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: headerContainer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(Icons.remove),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              controller: _con.myController.value,
                              textAlign: TextAlign.center,
                              showCursor: false,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                              // Disable the default soft keybaord
                              keyboardType: TextInputType.none,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: driverDetail(),
                  ),
                  // implement the custom NumPad
                  NumPad(
                    buttonSize: 60,
                    buttonColor: AppColors.lightBlue,
                    iconColor: AppColors.numColor,
                    controller: _con.myController.value,
                    delete: () {
                      if (_con.myController.value.text.isNotEmpty) {
                        _con.myController.value.text =
                            _con.myController.value.text.substring(
                                0, _con.myController.value.text.length - 1);
                      }
                    },
                    // do something with the input numbers
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton(
                    text: "sendtojoe".tr,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
