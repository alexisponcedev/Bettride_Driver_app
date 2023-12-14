import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/auth/createNewPassword/create_new_password_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  final ResetPasswordController _con = Get.put(ResetPasswordController());

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
                        title("reset".tr),
                        subTitle("passwrd".tr),
                      ],
                    ),
                    Image.asset(
                      ImageConstant.createpassword,
                      height: 110,
                      width: 110,
                    ),
                    disc("createstrongandsecurepasswordthatprotectyouraccount"
                        .tr),
                    Column(
                      children: [
                        AppTextField(
                          hintText: "password".tr,
                          prefixIcon: ImageConstant.password,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              ImageConstant.eye,
                              height: 20,
                            ),
                          ),
                          onChange: (value) {
                            _con.password.value = value;
                          },
                          errorMessage: _con.passwordError,
                        ),
                        const SizedBox(height: 15),
                        AppTextField(
                          hintText: "password".tr,
                          prefixIcon: ImageConstant.password,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              ImageConstant.eye,
                              height: 20,
                            ),
                          ),
                          onChange: (value) {
                            _con.confirmPassword.value = value;
                          },
                          errorMessage: _con.confirmPasswordError,
                        ),
                      ],
                    ),
                    AppButton(
                      text: "save".tr,
                      onPressed: () {
                        _con.onResetPassword();
                      },
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
