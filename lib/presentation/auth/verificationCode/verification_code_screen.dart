import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/plugins/otp/animation_type.dart';
import 'package:taxi_booking/core/plugins/otp/otp_text_field.dart';
import 'package:taxi_booking/core/plugins/otp/pin_theme.dart';
import 'package:taxi_booking/presentation/auth/verificationCode/verification_code_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({Key? key}) : super(key: key);
  final VerificationCodeController _con = Get.put(VerificationCodeController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      title("verification".tr),
                      subTitle("code".tr),
                      const SizedBox(height: 50),
                      disc("verificationcodewassentto".tr),
                      const SizedBox(height: 30),
                    ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: false,
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "+91 (987) 555-1234",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(
                              ImageConstant.edit,
                              height: 20,
                              width: 20,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 30),
                                child: PinCodeTextField(
                                  appContext: context,
                                  length: 4,
                                  obscureText: false,
                                  animationType: AnimationType.fade,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(10),
                                    fieldHeight: 60,
                                    fieldWidth: 60,
                                    activeFillColor: const Color(0xffF4F5FA),
                                    inactiveFillColor: const Color(0xffF4F5FA),
                                    selectedFillColor: AppColors.appColor,
                                    activeColor: const Color(0xffF4F5FA),
                                    selectedColor: AppColors.appColor,
                                    inactiveColor: const Color(0xffF4F5FA),
                                  ),
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                  enableActiveFill: true,
                                  onCompleted: (v) {
                                    if (kDebugMode) {
                                      print("Completed");
                                    }
                                    _con.otp.value = v;
                                  },
                                  onChanged: (value) {
                                    if (kDebugMode) {
                                      print(value);
                                    }

                                    _con.otp.value = value;
                                  },
                                  beforeTextPaste: (text) {
                                    if (kDebugMode) {
                                      print("Allowing to paste $text");
                                    }
                                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                    return true;
                                  },
                                )),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            // onTap: () => Get.toNamed(AppRoutes.loginScreen),
                            child: Text(
                              "resendcodein".tr + ' ',
                              style: TextStyle(
                                color: AppColors.textBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          GestureDetector(
                            // onTap: () => Get.toNamed(AppRoutes.loginScreen),
                            child: Text(
                              "00:16".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                color: AppColors.textGreyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      AppButton(
                        text: "resend".tr,
                        color: AppColors.lightBlue,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 20),
                      AppButton(
                        text: "sendcode".tr,
                        onPressed: () {
                          _con.onEnterOtp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
