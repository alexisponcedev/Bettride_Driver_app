import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/wellcomeSlider/wellcome_screen_con.dart';

class WellcomeScreen extends StatelessWidget {
  final WelcomeController _con = Get.put(WelcomeController());

  WellcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.loginSignUpScreen);
                          },
                          child: Text(
                            "skip".tr,
                            style: TextStyle(
                              color: Get.isDarkMode
                                  ? Colors.white54
                                  : Colors.black.withOpacity(.6),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CarouselSlider(
                      carouselController: _con.carouselController,
                      options: CarouselOptions(
                          height: Get.height * 0.65,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          autoPlay: false,
                          aspectRatio: 1.0,
                          onPageChanged: (index, reason) {
                            _con.currentIndex.value = index;
                          }),
                      items: List.generate(
                        4,
                        (index) => Container(
                          // color: Colors.amber,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: index == 0
                              ? Lottie.asset(
                                  _con.welcomeList[index].image!,
                                )
                              : Image.asset(
                                  _con.welcomeList[index].image!,
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) =>
                            indicator(index, _con.currentCarouselIndex.value),
                      ),
                    ),
                    // const SizedBox(height: 20),
                    // Text(
                    //   _con.welcomeList[_con.currentIndex.value].title,
                    //   style: TextStyle(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.w700,
                    //     color: Get.isDarkMode ? Colors.white : Colors.black,
                    //     height: 1.3,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    // const SizedBox(height: 20),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: Text(
                    //     _con.welcomeList[_con.currentIndex.value].subtitle,
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w400,
                    //       color: Get.isDarkMode
                    //           ? Colors.white.withOpacity(.6)
                    //           : Colors.black.withOpacity(.6),
                    //       height: 1.3,
                    //       fontSize: 16,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.07,
                ),
                AppButton(
                  text: _con.currentIndex.value == 3 ? "start".tr : "next".tr,
                  onPressed: () {
                    _con.currentIndex.value;
                    _con.currentIndex.value == 3
                        ? Get.toNamed(AppRoutes.loginSignUpScreen)
                        : _con.carouselController.nextPage();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  indicator(
    int index,
    int value,
  ) {
    return Obx(() => Container(
          margin: const EdgeInsets.all(4),
          height: 8,
          width: index == _con.currentIndex.value ? 20 : 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: index == _con.currentIndex.value
                  ? AppColors.appColor
                  : Colors.transparent,
              border: Border.all(
                  width: 1,
                  color: index == _con.currentIndex.value
                      ? AppColors.appColor
                      : const Color(0xffB8BABF))),
        ));
  }
}
