import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/helper.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text_field.dart';
import 'package:taxi_booking/presentation/commonWidgets/header_container.dart';

class PaymentController extends GetxController {
  List tabs = ['settings'.tr, "transactions".tr];
  RxInt selectedTabIndex = 0.obs;
  RxString name = "".obs;
  RxString nameError = "".obs;
  RxString cardNo = "".obs;
  RxString cardNoError = "".obs;
  RxString expDate = "".obs;
  RxString expDateError = "".obs;
  RxString cvv = "".obs;
  RxString cvvError = "".obs;

  bool valid() {
    RxBool isValid = true.obs;
    if (name.value.isEmpty) {
      nameError.value = "Please enter a valid email address";
      isValid.value = false;
    }
    if (cardNo.value.isEmpty) {
      cardNoError.value = "Please enter a valid password";
      isValid.value = false;
    } else if (!Helper.isCardNumber(cardNo.value)) {
      cardNoError.value = "The password must contain at least six character";
      isValid.value = false;
    }
    if (expDate.value.isEmpty) {
      expDateError.value = "Please enter a valid email address";
      isValid.value = false;
    }
    if (cvv.value.isEmpty) {
      cvvError.value = "Please enter a valid password";
      isValid.value = false;
    } else if (!Helper.isCardNumber(cvv.value)) {
      cvvError.value = "The password must contain at least six character";
      isValid.value = false;
    }
    return isValid.value;
  }

  void addNewCard(context) async {
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
              height: Get.height - 180,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  headerContainer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Image.asset(
                      ImageConstant.paymentbg,
                      height: 135,
                      width: 135,
                    ),
                  ),
                  Text(
                    "addnewcard".tr,
                    style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "addyourdebitcreaditcard".tr,
                    style: TextStyle(
                      color: AppColors.textGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 25),
                  AppTextField(
                    onChange: (val) {
                      name.value = val;
                    },
                    hintText: "cardholdername".tr,
                    prefixIcon: ImageConstant.user,
                    errorMessage: name,
                  ),
                  const SizedBox(height: 10),
                  AppTextField(
                    onChange: (val) {
                      cardNo.value = val;
                    },
                    hintText: "cardnumber".tr,
                    prefixIcon: ImageConstant.payment,
                    errorMessage: cardNoError,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          onChange: (val) {
                            name.value = val;
                          },
                          hintText: "expirydate".tr,
                          errorMessage: name,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AppTextField(
                          onChange: (val) {
                            cardNo.value = val;
                          },
                          hintText: "cvv".tr,
                          errorMessage: cardNoError,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  AppButton(
                    text: "add".tr,
                  )
                ],
              ),
            ),
          );
        });
  }
}
