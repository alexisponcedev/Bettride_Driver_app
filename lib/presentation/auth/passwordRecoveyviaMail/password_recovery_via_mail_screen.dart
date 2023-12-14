import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/auth/passwordRecoveyviaMail/password_recovery_via_mail_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text_field.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  PasswordRecoveryScreen({Key? key}) : super(key: key);
  final PasswordRecoveryController _con = Get.put(PasswordRecoveryController());

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
                        title("passwrd".tr),
                        subTitle("recovery".tr),
                      ],
                    ),
                    Image.asset(
                      ImageConstant.recovery,
                      height: 110,
                      width: 110,
                    ),
                    disc("pleaseenteryouremailtorecoveryourpassword".tr),
                    Column(
                      children: [
                        AppTextField(
                          hintText: "emailaddress".tr,
                          prefixIcon: ImageConstant.email,
                          onChange: (value) {
                            _con.email.value = value;
                          },
                          errorMessage: _con.emailError,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        AppButton(
                          text: "sendlink".tr,
                          onPressed: () {
                            _con.onForgotPassword();
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
