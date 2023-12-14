import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/cancel_trip/cancel_trip_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';

class CancelTripScreen extends StatelessWidget {
  CancelTripScreen({Key? key}) : super(key: key);
  final CancelTripController _con = Get.put(CancelTripController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
          text: "canceltrip".tr,
          back: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "pleaseselectthereasonforcancellation:".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Column(
                children: List.generate(
                  _con.cancelList.length,
                  (index) {
                    return Row(
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              if (_con.isselect.contains(index)) {
                                _con.isselect.remove(index);
                              } else {
                                _con.isselect.add(index);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: _con.isselect.contains(index)
                                      ? const Color(0xff06B966)
                                      : null,
                                  border: _con.isselect.contains(index)
                                      ? null
                                      : Border.all(
                                          color: AppColors.appIconColor,
                                          width: 5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(ImageConstant.done),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          _con.cancelList[index]["text"],
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textBlackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              AppButton(
                text: "submit".tr,
                onPressed: () {
                  Get.back();
                  Get.back();
                  _con.controller.pageIndex.value = 4;
                },
              )
            ],
          ),
        ));
  }
}
