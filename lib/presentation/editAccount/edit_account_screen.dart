import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text_field.dart';
import 'package:taxi_booking/presentation/editAccount/edit_sccount_controller.dart';

class EditAccountScreen extends StatelessWidget {
  EditAccountScreen({Key? key}) : super(key: key);
  final EditAccountController _con = Get.put(EditAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "editaccount".tr,
        back: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Obx(
                  () => Container(
                    height: Get.height / 4.5,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: _con.profileImage.value.path.isEmpty
                            ? _con.profileUrl.value != ""
                                ? Image.network(
                                    _con.profileUrl.value,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    ImageConstant.profileImage,
                                    fit: BoxFit.cover,
                                  )
                            : Image.file(
                                _con.profileImage.value,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height / 9 - 15,
                  right: Get.width / 2 - 45,
                  child: GestureDetector(
                    onTap: () {
                      _con.pickProfileFile(context);
                    },
                    child: Image.asset(
                      ImageConstant.camera,
                      height: 30,
                      width: 30,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              controller: _con.fullNameController.value,
              hintText: "fullname".tr,
              prefixIcon: ImageConstant.user,
              errorMessage: _con.fullNameError,
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: _con.emailController.value,
              hintText: "emailaddress".tr,
              prefixIcon: ImageConstant.email,
              errorMessage: _con.emailError,
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: _con.passwordController.value,
              hintText: "password".tr,
              obsecureText: true,
              prefixIcon: ImageConstant.password,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  ImageConstant.eye,
                  height: 20,
                ),
              ),
              errorMessage: _con.passwordError,
            ),
            const SizedBox(height: 50),
            AppButton(
              text: "save".tr,
              onPressed: () {
                _con.updateProfile();
              },
            )
          ],
        ),
      ),
    );
  }
}
