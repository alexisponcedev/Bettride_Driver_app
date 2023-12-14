import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/auth/verifyphonenumber/verify_phone_number_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text_field.dart';
import 'package:taxi_booking/presentation/commonWidgets/country.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  VerifyPhoneNumberScreen({Key? key}) : super(key: key);
  final VerifyPhoneNumberController _con =
      Get.put(VerifyPhoneNumberController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(),
                    Column(
                      children: [
                        title("verifyphone".tr),
                        subTitle("number".tr),
                      ],
                    ),
                    disc("pleaseconfirmyourcountrycodeandenteryourphonenumber:"
                        .tr),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.borderColor,
                                width: 2,
                              )),
                          child: DropdownButtonHideUnderline(
                            child: Obx(
                              () => Row(
                                children: [
                                  Text(
                                    _con.generateFlagEmojiUnicode(
                                      _con.productCondition
                                              .value?['alpha_2_code']
                                              .toString()
                                              .replaceAll('+', '') ??
                                          "IN",
                                    ),
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    height: 20,
                                    width: 2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffC3CDDB),
                                    ),
                                  ),
                                  Expanded(
                                    child: DropdownButton<Map>(
                                      hint: const Text("India"),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: AppColors.appIconColor,
                                        size: 30,
                                      ),
                                      isExpanded: true,
                                      items: Countries.countryList
                                          .map((Map value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value['en_short_name'],
                                            style: const TextStyle(),
                                          ),
                                        );
                                      }).toList(),
                                      value: _con.productCondition.value,
                                      onChanged: (e) {
                                        _con.productCondition.value = e;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => AppTextField(
                            icon: false,
                            hintText: "phonenumber".tr,
                            prefixIcon: _con.generatecode(
                              _con.productCondition.value?['dial_code']
                                      .toString() ??
                                  "+91",
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: _con.phoneController,
                            errorMessage: _con.phoneNoError,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        AppButton(
                          text: "sendcode".tr,
                          onPressed: () {
                            _con.verifyPhoneNumber();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
