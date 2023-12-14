import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/change_password/change_password_controller.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final ChangePasswordController _con = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "", back: true),
      extendBodyBehindAppBar: true,
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
                    const SizedBox(
                      height: 70,
                    ),
                    Column(
                      children: [
                        title("change".tr),
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
                          hintText: "currentpassword".tr,
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
                        const SizedBox(height: 15),
                        AppTextField(
                          hintText: "newpassword".tr,
                          prefixIcon: ImageConstant.password,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              ImageConstant.eye,
                              height: 20,
                            ),
                          ),
                          onChange: (value) {
                            _con.newPassword.value = value;
                          },
                          errorMessage: _con.newPasswordError,
                        ),
                        const SizedBox(height: 15),
                        AppTextField(
                          hintText: "confirmpassword".tr,
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
                        _con.onChangePassword();
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
