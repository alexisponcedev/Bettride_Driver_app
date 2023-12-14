import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "mywallet".tr,
        back: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: -40,
                  right: 60,
                  left: 60,
                  child: Container(
                    height: 170,
                    width: Get.width - 160,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.6),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: 30,
                  left: 30,
                  child: Container(
                    height: 170,
                    width: Get.width - 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  height: 170,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(ImageConstant.wallet),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "wallet".tr,
                                style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "defultpaymentmethod".tr,
                                style: TextStyle(
                                  color: AppColors.textGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "balance".tr,
                                style: TextStyle(
                                  color: AppColors.textGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "\$25.00",
                                style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(12),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * .08,
            ),
            walletList(
              icon: ImageConstant.payment,
              name: "paymentmethods".tr,
              ontap: () {},
              subtext: '',
            ),
            walletList(
              icon: ImageConstant.coupon,
              name: "coupon".tr,
              ontap: () {},
              subtext: '  (3)',
            ),
            walletList(
              icon: ImageConstant.transaction,
              name: "transactions".tr,
              ontap: () {},
              subtext: '  (5)',
            )
          ],
        ),
      ),
    );
  }

  Widget walletList({
    required String icon,
    required String name,
    required String subtext,
    required Function() ontap,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
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
              child: Image.asset(icon),
            ),
            const SizedBox(width: 20),
            RichText(
              text: TextSpan(
                text: name,
                style: TextStyle(
                  color: AppColors.textBlackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: subtext,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.textGreyColor,
                      )),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Image.asset(
                  ImageConstant.right,
                  color: AppColors.textBlackColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
