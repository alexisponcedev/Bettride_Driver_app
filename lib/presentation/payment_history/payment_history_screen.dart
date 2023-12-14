import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/payment_history/componets/canceled.dart';
import 'package:taxi_booking/presentation/payment_history/componets/complited.dart';
import 'package:taxi_booking/presentation/payment_history/payment_history_controller.dart';

class PaymentHistoryScreen extends StatelessWidget {
  PaymentHistoryScreen({Key? key}) : super(key: key);
  final PaymentHistoryController _con = Get.put(PaymentHistoryController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: appBar(text: "paymenthistory".tr, back: true),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 10),
                tabContainer(),
                Expanded(
                  child: _con.selectedTabIndex.value == 0
                      ? const PaymentComplitedScreen()
                      : const PaymentCanceledScreen(),
                ),
              ],
            ),
          )),
    );
  }

  tabContainer() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _con.tabs.length,
            (index) => tabButton(_con.tabs[index], index),
          ),
        ),
      );

  tabButton(
    String title,
    int value,
  ) =>
      Expanded(
        child: Obx(
          () => GestureDetector(
            onTap: () => _con.selectedTabIndex.value = value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: 50,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _con.selectedTabIndex.value == value
                    ? AppColors.appColor
                    : Colors.transparent,
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: _con.selectedTabIndex.value == value
                      ? FontWeight.w600
                      : FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
}
