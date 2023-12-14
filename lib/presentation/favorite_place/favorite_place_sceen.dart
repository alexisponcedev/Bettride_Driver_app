import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_button.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_text_field.dart';
import 'package:taxi_booking/presentation/favorite_place/favorite_place_controller.dart';

class FavoritePlaceScreen extends StatelessWidget {
  FavoritePlaceScreen({Key? key}) : super(key: key);
  final FavoritePlaceController _con = Get.put(FavoritePlaceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        backColor: AppColors.lightBlue,
        backgroundColor: Colors.white,
        text: "favoriteplace".tr,
        back: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Image.asset(
                    ImageConstant.favoriteplace,
                    height: 150,
                  ),
                  Column(
                    children: [
                      AppTextField(
                        hintText: "placename".tr,
                        prefixIcon: ImageConstant.pin,
                        onChange: (value) {
                          _con.place.value = value;
                        },
                        errorMessage: _con.placeError,
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        hintText: "placeaddress".tr,
                        prefixIcon: ImageConstant.location,
                        onChange: (value) {
                          _con.placeAddress.value = value;
                        },
                        errorMessage: _con.placeAddressError,
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.appColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.my_location,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppButton(
                    text: "placeaddress".tr,
                    onPressed: () {
                      _con.favoritePlace();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      _con.placeList.length,
                      (index) => Obx(
                        () => GestureDetector(
                          onTap: () {
                            _con.isSelect.value = index;
                          },
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 70,
                              width: 65,
                              decoration: BoxDecoration(
                                color: _con.isSelect.value == index
                                    ? AppColors.appColor
                                    : AppColors.lightBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    _con.placeList[index]["icon"],
                                    height: 25,
                                    width: 25,
                                    color: _con.isSelect.value == index
                                        ? Colors.black
                                        : AppColors.appIconColor,
                                  ),
                                  Text(
                                    _con.placeList[index]["name"],
                                    style: TextStyle(
                                        color: _con.isSelect.value == index
                                            ? Colors.black
                                            : AppColors.textBlueColor),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
