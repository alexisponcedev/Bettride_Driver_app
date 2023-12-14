import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';

class DriverDetailScreen extends StatelessWidget {
  const DriverDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "driverdetails".tr,
        back: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: Get.height * .11,
                width: Get.height * .11,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.profileImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              "joesmith".tr,
              style: TextStyle(
                color: AppColors.textBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstant.call,
                    height: 20,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "+91 (987) 555-0123",
                    style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  info(
                    image: ImageConstant.rating,
                    text: '3.1 ',
                    subtext: "point".tr,
                  ),
                  _dottedline(),
                  info(
                    image: ImageConstant.floatingicon,
                    text: "126 ",
                    subtext: "trips".tr,
                  ),
                  _dottedline(),
                  info(
                    image: ImageConstant.time,
                    text: "3 ",
                    subtext: "years".tr,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  catagory(text: "membersince".tr),
                  details(text: "2019 05 October"),
                  divider(),
                  catagory(text: "carmodel".tr),
                  details(text: "22 A 228 10"),
                  divider(),
                  catagory(text: "platenumber".tr),
                  details(text: "HS785K"),
                  divider(),
                  catagory(text: "membersince".tr),
                  details(text: "2019 05 October"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Divider divider() {
    return Divider(
      thickness: 2,
      color: AppColors.borderColor,
      height: 10,
    );
  }

  Text details({required String text}) {
    return Text(
      text,
      style: TextStyle(
        height: 2,
        color: AppColors.textBlackColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Text catagory({required String text}) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textGreyColor,
        fontSize: 15,
        height: 2,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget info({
    required String image,
    required String text,
    required String subtext,
  }) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            image,
            height: 25,
            width: 25,
            color: AppColors.appIconColor,
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(
                color: AppColors.textBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: subtext,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.textGreyColor,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _dottedline() {
    return const SizedBox(
      height: 20,
      width: 20,
      child: DottedLine(
        direction: Axis.vertical,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 6.0,
        dashColor: Color(0xffE0E4F5),
        dashRadius: 0.0,
        dashGapLength: 3.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }

  // Widget textfield({required String label}) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 5),
  //     child: TextFormField(
  //       style: TextStyle(
  //         color: AppColors.textBlackColor,
  //         fontSize: 16,
  //         fontWeight: FontWeight.w700,
  //       ),
  //       decoration: InputDecoration(
  //         labelText: label,
  //         labelStyle: TextStyle(
  //           color: AppColors.textGreyColor,
  //           fontSize: 15,
  //           fontWeight: FontWeight.w500,
  //         ),
  //         focusedBorder: const UnderlineInputBorder(
  //           borderSide: BorderSide(color: Colors.black),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
