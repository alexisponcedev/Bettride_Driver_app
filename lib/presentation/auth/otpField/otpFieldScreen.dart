import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/presentation/auth/otpField/enter_otp_screen_controller.dart';

import '../../../core/plugins/otp/otp_text_field.dart';
import '../../../core/plugins/otp/pin_theme.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/widgets/next_button_widget.dart';

class EnterOtpScreen extends StatefulWidget {
  const EnterOtpScreen({super.key});

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  final EnterOtpScreenController _con = Get.put(EnterOtpScreenController());
  Map data = {};
  @override
  void initState() {
    // TODO: implement initState
    _con.startTimer();
    super.initState();
  }

  @override
  @override
  void didChangeDependencies() {
    data = Get.arguments;
    if (data["data"] != null) {
      _con.registerResposeData = data["data"];
    }
    log(data.toString());
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _con.timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Obx(
          () => Text(
            _con.emailOTP.value
                ? "Verify your phone number".tr
                : "Verify your phone number".tr,
            style: TextStyle(
              color: AppColors.textBlackColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            Image.asset(
              "assets/images/otp.png",
              height: 200,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "OTP Verification".tr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.jetBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Obx(
              () => RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: "enterotpString".tr,
                    style:
                        TextStyle(color: AppColors.jetBlackColor, fontSize: 15),
                    children: <TextSpan>[
                      const TextSpan(
                        text: " ",
                      ),
                      TextSpan(
                          text: _con.emailOTP.value
                              ? data["email"]
                              : '+91-123456789',
                          style: TextStyle(
                              color: AppColors.jetBlackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
            ),
            // Text(
            //   "enterotpString".tr,
            //   maxLines: 1,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(color: AppColors.jetBlackColor),
            // ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: PinCodeTextField(
                length: 5,
                appContext: context,
                keyboardType: TextInputType.phone,
                backgroundColor: Colors.transparent,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeColor: AppColors.primaryColor,
                    activeFillColor: Colors.grey.shade100,
                    selectedFillColor: Colors.transparent,
                    selectedColor: AppColors.primaryColor,
                    inactiveColor: Colors.grey.shade600,
                    inactiveFillColor: Colors.transparent),
                enableActiveFill: true,
                onCompleted: (v) {
                  _con.OTP = v;
                },
                onChanged: (value) {
                  _con.OTP = value;
                },
              ),
            ),
            // TextFormField(
            //   cursorColor: AppColors.primaryColor,
            //   textAlignVertical: TextAlignVertical.center,
            //   keyboardType: TextInputType.number,
            //   // validator: validateName,
            //   controller: _con.otpController,
            //   onSaved: (String? val) {
            //     // firstName = val;
            //   },
            //   textInputAction: TextInputAction.next,
            //   decoration: InputDecoration(
            //     contentPadding:
            //         new EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            //     fillColor: Colors.white,
            //     hintText: "Enter the OTP Code".tr,
            //     focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //         borderSide:
            //             BorderSide(color: AppColors.primaryColor, width: 2.0)),
            //     errorBorder: OutlineInputBorder(
            //       borderSide:
            //           BorderSide(color: Theme.of(context).colorScheme.error),
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //     focusedErrorBorder: OutlineInputBorder(
            //       borderSide:
            //           BorderSide(color: Theme.of(context).colorScheme.error),
            //       borderRadius: BorderRadius.circular(15.0),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey.shade200),
            //       borderRadius: BorderRadius.circular(15.0),
            //     ),
            //   ),
            // ),
            Obx(
              () => _con.start.value == 0
                  ? TextButton(
                      onPressed: () {
                        if (_con.start.value == 0) {
                          _con.start.value = 59;
                          _con.startTimer();
                        }
                      },
                      child: Text(
                        _con.emailOTP.value == true
                            ? "Resend code via Email".tr
                            : "Resend code vis SMS".tr,
                        style: TextStyle(
                            color: _con.start.value == 0
                                ? Colors.blue
                                : Colors.grey),
                      ))
                  : TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend code in ${_con.start.value} Sec",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.jetBlackColor),
                      )),
            )
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => nextButtonWidget(
          height: height,
          width: width,
          loading: _con.apiLoading.value,
          onTap: () {
            _con.verifyOTP();
            // if (data["email"] != "" && _con.emailOTP.value == false) {
            //   _con.start.value = 59;
            //   _con.emailOTP.value = true;
            // } else {

            //   // Get.toNamed(AppRoutes.bottomBarScreen);
            // }
          },
        ),
      ),
    );
  }
}
