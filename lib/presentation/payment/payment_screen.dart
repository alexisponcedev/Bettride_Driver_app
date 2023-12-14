import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/payment/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  final PaymentController _con = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: appBar(
          text: "payment".tr,
          back: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "selectaccount".tr,
                    style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _con.addNewCard(context);
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: Get.height / 4.5,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.creditcardimage))),
              ),
              const SizedBox(height: 40),
              tabContainer(),
              _con.selectedTabIndex.value == 0 ? settings() : translations()
            ],
          ),
        ),
      ),
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

  settings() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(height: 10),
          settingList(),
          const SizedBox(height: 10),
          settingList(),
        ],
      ),
    );
  }

  Row settingList() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "defaultcard".tr,
              style: TextStyle(
                color: AppColors.textBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "setthiscardasyourdefault".tr,
              style: TextStyle(
                color: AppColors.textGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Spacer(),
        FlutterSwitch(
          height: 30,
          width: 50,
          padding: 6,
          toggleSize: 15,
          value: true,
          toggleColor: Colors.white,
          activeToggleColor: Colors.white,
          activeColor: AppColors.appColor,
          inactiveColor: Colors.white,
          inactiveToggleColor: const Color(0xffB8BABF),
          inactiveSwitchBorder: Border.all(
            color: const Color(0xffB8BABF),
            width: 3,
          ),
          onToggle: (val) {
            // _con.isDark.value = val;
            // if (val == true) {
            //   Get.changeThemeMode(ThemeMode.dark);
            // } else {
            //   Get.changeThemeMode(ThemeMode.light);
            // }
          },
        )
      ],
    );
  }

  translations() {
    return Text("transactions".tr);
  }
}
