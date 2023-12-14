import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text_field.dart';

import '../payout_controller.dart';

class OnlinePayout extends StatelessWidget {
  final PayoutController _con = Get.put(PayoutController());
  OnlinePayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Center(
            child: Text(
              "\$25.00",
              style: TextStyle(
                color: AppColors.textBlackColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "paymentmethod".tr,
            style: TextStyle(
              color: AppColors.textBlackColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Column(
          children: List.generate(
            _con.paymentMethodList.length,
            (index) => Obx(
              () => GestureDetector(
                onTap: () {
                  _con.paymentIndex.value = index;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 70,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        _con.paymentMethodList[index]["image"],
                        height: 20,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        _con.paymentMethodList[index]["name"],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        _con.paymentIndex.value == index
                            ? ImageConstant.radiochecked
                            : ImageConstant.radiounchecked,
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "paymentmethod".tr,
            style: TextStyle(
              color: AppColors.textBlackColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        AppTextField(
          hintText: "promocodeoptional".tr,
          obsecureText: true,
          prefixIcon: ImageConstant.link,
          errorMessage: _con.promoError,
          onChange: (val) {
            _con.promo.value = val;
          },
        ),
        const Spacer(),
        AppButton(
          text: "proceedtopay".tr,
          onPressed: () {
            Get.toNamed(AppRoutes.thankyouScreen);
          },
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
