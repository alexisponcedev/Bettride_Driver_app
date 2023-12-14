import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/core/Common/commons.dart';
import 'package:taxi_booking/presentation/auth/DocumentsUpload/BikeData/upload_bike_data_Controller.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/helper.dart';
import '../PersonalData/upload_personal_data.dart';
import '../PersonalData/upload_personal_data_controller.dart';

class uploadBikeData extends StatefulWidget {
  const uploadBikeData({super.key});

  @override
  State<uploadBikeData> createState() => _uploadBikeDataState();
}

class _uploadBikeDataState extends State<uploadBikeData> {
  final UploadBikeDataController _con = Get.put(UploadBikeDataController());
  final UploadBikePersonalController _dcon =
      Get.put(UploadBikePersonalController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, top: 10, right: 8, bottom: 8),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                // alignment: Alignment.bottomCenter,
                children: <Widget>[
                  upload_documents_title(
                    title: "Bike front image",
                    onTap: () async {
                      _con.isBikeFrontLoading.value = true;
                      _con.onCameraClick(upladedPersonalImages.bikeFront);
                    },
                  ),
                  _con.bikeFrontImage.value == ""
                      ? const SizedBox()
                      : Document_card_widget(
                          con: _dcon,
                          loading: _con.isBikeFrontLoading,
                          path: _con.bikeFrontImage.toString(),
                        ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, top: 10, right: 8, bottom: 8),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                // alignment: Alignment.bottomCenter,
                children: <Widget>[
                  upload_documents_title(
                    title: "Bike back image",
                    onTap: () async {
                      _con.isBikeBackLoading.value = true;
                      _con.onCameraClick(upladedPersonalImages.bikeBack);
                    },
                  ),
                  _con.bikeBackImage.value == ""
                      ? const SizedBox()
                      : Document_card_widget(
                          con: _dcon,
                          loading: _con.isBikeBackLoading,
                          path: _con.bikeBackImage.toString(),
                        ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Bike Model".tr,
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
                )),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8),
              child: TextFormField(
                controller: _con.bikeModel,
                validator: Helper.validateEmpty,
                //editing controller of this TextField
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  fillColor: Colors.white,
                  hintText: ('Enter your  Bike Model'.tr),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor, width: 2.0)),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Select Year"),
                        content: SizedBox(
                          // Need to use container to add size constraint.
                          width: 300,
                          height: 300,
                          child: YearPicker(
                            firstDate: DateTime(DateTime.now().year - 100, 1),
                            lastDate: DateTime(DateTime.now().year + 100, 1),
                            initialDate: DateTime.now(),
                            // save the selected date to _selectedDate DateTime variable.
                            // It's used to set the previous selected date when
                            // re-showing the dialog.
                            selectedDate: DateTime.now(),
                            onChanged: (DateTime dateTime) {
                              _con.bikeModel.text =
                                  dateTime.toString().split("-")[0];
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Bike Number".tr,
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
                )),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 8.0, left: 8.0),
              child: TextFormField(
                cursorColor: AppColors.primaryColor,
                textAlignVertical: TextAlignVertical.center,
                controller: _con.regNumController,
                validator: Helper.validateEmpty,
                // onSaved: (String? val) {
                //   firstName = val;
                // },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  fillColor: Colors.white,
                  hintText: ('Enter your bike number'.tr),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor, width: 2.0)),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bike Color".tr,
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
                ),
                InkWell(
                  onTap: () {
                    _con.showColorPicker(context);
                  },
                  child: Obx(
                    () => Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: _con.bikeColor.value,
                          border: Border.all(
                              width: 1, color: AppColors.jetBlackColor)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
