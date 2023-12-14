import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text.dart';

class FindPasswordOptionScreen extends StatelessWidget {
  const FindPasswordOptionScreen({Key? key}) : super(key: key);

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
                        title("findpassword".tr),
                        subTitle("options".tr),
                      ],
                    ),
                    Image.asset(
                      ImageConstant.option,
                      height: 110,
                      width: 110,
                    ),
                    disc("pleaseselectoptiontosendlinkresetpassword".tr),
                    Column(
                      children: [
                        option(
                          image: ImageConstant.mail,
                          ontap: () {
                            Get.toNamed(AppRoutes.passwordRecoveryViaMail);
                          },
                          text: "resetviaemail".tr,
                          subtext: "ifyouhaveemaillinkedtoaccount".tr,
                        ),
                        option(
                          image: ImageConstant.sms,
                          ontap: () {
                            Get.toNamed(AppRoutes.verifyPhoneNumberScreen);
                          },
                          text: "resetviasms".tr,
                          subtext: "ifyouhavenumberlinkedtoaccount".tr,
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

  Widget option({
    required String image,
    required String text,
    required String subtext,
    Function()? ontap,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.lightappColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(image),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtext,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
