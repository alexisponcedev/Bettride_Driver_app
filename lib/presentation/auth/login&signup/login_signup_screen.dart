import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/widgets/next_button_widget.dart';
import 'package:taxi_booking/presentation/auth/login&signup/login_signup_controller.dart';

class LoginSignUpScreen extends StatelessWidget {
  LoginSignUpScreen({Key? key}) : super(key: key);
  final LoginSignupController _con = Get.put(LoginSignupController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor:
            Get.isDarkMode ? Colors.black : AppColors.textWhiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Login".tr,
            style: TextStyle(
              color: AppColors.textBlackColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: LayoutBuilder(builder: (context, constraint) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey.shade200)),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) =>
                        _con.phoneNumber!.value = number.phoneNumber.toString(),
                    // onInputValidated: (bool value) => _isPhoneValid = value,
                    ignoreBlank: true,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    inputDecoration: InputDecoration(
                      hintText: 'Phone Number'.tr,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    inputBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    initialValue: PhoneNumber(isoCode: 'MAR'),
                    selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "mobilenumstring".tr,
                  style: TextStyle(color: AppColors.jetBlackColor),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.GetUserDataScreen);
                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(
                            color: AppColors.jetBlackColor, fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign up',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                ),
              ),
            ],
          );
        }),
        floatingActionButton: nextButtonWidget(
            height: height,
            width: width,
            loading: false,
            onTap: () {
              Get.toNamed(AppRoutes.otpFiledScreen, arguments: {
                "from_signup": true,
                "phone": _con.phoneNumber,
                "email": ""
              });
            }));
  }

  Widget socialButton({
    Function? onTap,
    required String img,
  }) =>
      GestureDetector(
        onTap: () => onTap!,
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xffD4D4D4),
            ),
          ),
          child: Image.asset(
            img,
          ),
        ),
      );
}
