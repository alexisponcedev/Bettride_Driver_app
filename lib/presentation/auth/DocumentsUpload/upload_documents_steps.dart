import 'dart:convert';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/core/widgets/next_button_widget.dart';
import 'package:taxi_booking/core/widgets/previous_btn_widget.dart';
import 'package:taxi_booking/presentation/auth/DocumentsUpload/OtherData/other_data_controller.dart';
import 'package:taxi_booking/presentation/auth/DocumentsUpload/OtherData/other_data_screen.dart';
import 'package:taxi_booking/presentation/auth/DocumentsUpload/PersonalData/upload_personal_data.dart';
import 'package:taxi_booking/presentation/auth/DocumentsUpload/PersonalData/upload_personal_data_controller.dart';
import 'package:taxi_booking/presentation/auth/DocumentsUpload/upload_documents_controller.dart';

import '../../../core/utils/app_color.dart';
import '../../../data/api_interface.dart';
import '../../../model/other_document_json.dart';
import '../../../model/user_profilr_json.dart';
import '../../../model/vechile_data_json.dart';
import '../../../routes/app_routes.dart';
import 'BikeData/upload_bike_data.dart';
import 'BikeData/upload_bike_data_Controller.dart';
import 'FinishUplaod/succuss_Screen.dart';

class DocumentUplaodScreen extends StatefulWidget {
  const DocumentUplaodScreen({Key? key}) : super(key: key);

  @override
  State<DocumentUplaodScreen> createState() => _MyAppState();
}

class _MyAppState extends State<DocumentUplaodScreen> {
  //
  final UploadDocumentsController _con = Get.put(UploadDocumentsController());
  final UploadBikePersonalController _personalCon =
      Get.put(UploadBikePersonalController());
  final UploadOtherController _othercon = Get.put(UploadOtherController());
  final UploadBikeDataController _bikecon = Get.put(UploadBikeDataController());
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  Set<int> reachedSteps = <int>{0, 1, 2, 3};

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.2);
    } else {
      setState(() => progress = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Upload Documents".tr,
          style: TextStyle(
            color: AppColors.textBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //     flex: 1, child: _previousStep(StepEnabling.individual)),
                  Expanded(
                    flex: 15,
                    child: EasyStepper(
                      activeStep: _con.activeStep2.value,
                      reachedSteps: reachedSteps,
                      lineStyle: LineStyle(
                        lineLength: 80,
                        lineSpace: 4,
                        lineType: LineType.dotted,
                        finishedLineColor: AppColors.primaryColor,
                        unreachedLineColor: AppColors.greyColor,
                        activeLineColor: AppColors.greyColor,
                      ),
                      activeStepBorderColor: AppColors.primaryColor,
                      activeStepIconColor: AppColors.primaryColor,
                      activeStepTextColor: AppColors.primaryColor,
                      activeStepBackgroundColor: AppColors.textWhiteColor,
                      unreachedStepBackgroundColor:
                          Colors.blueGrey.withOpacity(0.5),
                      unreachedStepBorderColor:
                          Colors.blueGrey.withOpacity(0.5),
                      unreachedStepIconColor: AppColors.textGreyColor,
                      unreachedStepTextColor: AppColors.textGreyColor,
                      finishedStepBackgroundColor: AppColors.greyColor,
                      // finishedStepBorderColor: AppColors.textGreyColor,
                      // finishedStepIconColor: AppColors.textGreyColor,
                      finishedStepTextColor: AppColors.textGreyColor,
                      borderThickness: 2,
                      internalPadding: 15,
                      showStepBorder: true,
                      showLoadingAnimation: false,
                      stepRadius: 20,
                      // stepShape: baseStep.StepShape.rRectangle,
                      showTitle: true,
                      steps: [
                        EasyStep(
                          icon: const Icon(CupertinoIcons.profile_circled),
                          title: 'Personal',
                          // lineText: 'Add Address Info',
                          enabled:
                              _allowTabStepping(0, StepEnabling.individual),
                          // showBadge: true,
                        ),
                        EasyStep(
                          icon: const Icon(Icons.pedal_bike),
                          title: 'Bike',
                          // lineText: 'Go To Checkout',
                          enabled:
                              _allowTabStepping(1, StepEnabling.individual),
                        ),
                        EasyStep(
                          icon: const Icon(Icons.edit_document),
                          title: 'Other',
                          // lineText: 'Go To Checkout',
                          enabled:
                              _allowTabStepping(1, StepEnabling.individual),
                        ),
                        EasyStep(
                          icon: const Icon(Icons.check_circle_outline),
                          title: 'Finish',
                          enabled:
                              _allowTabStepping(2, StepEnabling.individual),
                        ),
                      ],
                      onStepReached: (index) => setState(() {
                        _con.activeStep2.value = index;
                      }),
                    ),
                  ),
                  // Expanded(flex: 1, child: _nextStep(StepEnabling.individual)),
                ],
              ),
              _con.activeStep2.value == 0
                  ? const uploadPersonalData()
                  : _con.activeStep2.value == 1
                      ? const uploadBikeData()
                      : _con.activeStep2.value == 2
                          ? const uploadOtherData()
                          : const successScreen()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: height * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: _con.activeStep2.value > 0,
                child: _previousStep(StepEnabling.individual, height, width),
              ),
              _nextStep(StepEnabling.individual, height, width)
            ],
          ),
        ),
      ),
    );
  }

  bool _allowTabStepping(int index, StepEnabling enabling) {
    return enabling == StepEnabling.sequential
        ? index <= reachedStep
        : reachedSteps.contains(index);
  }

  Widget _nextStep(StepEnabling enabling, double height, double width) {
    return nextButtonWidget(
        height: height,
        width: width,
        loading: _con.isDataUploading.value,
        onTap: () async {
          if (_con.activeStep2.value == 0) {
            if (_con.activeStep2.value == 0) {
              setState(() {
                _con.isDataUploading.value = true;
              });

              userprofileJson json = userprofileJson(
                  driver: Driver(
                      dpi: _personalCon.nameList[0],
                      dlfi: _personalCon.nameList[0],
                      dlpi: _personalCon.nameList[0]));
              await ApiInterface()
                  .uploadDriverInfo("driver", jsonEncode(json.toJson()))
                  .then((value) {
                setState(() {
                  _con.isDataUploading.value = false;
                });
                if (value == 200) {
                  setState(() {
                    if (enabling == StepEnabling.sequential) {
                      ++_con.activeStep2.value;
                      if (reachedStep < _con.activeStep2.value) {
                        reachedStep = _con.activeStep2.value;
                      }
                    } else {
                      _con.activeStep2.value = reachedSteps.firstWhere(
                          (element) => element > _con.activeStep2.value);
                    }
                  });
                }
              });
            }
          } else if (_con.activeStep2.value == 1) {
            setState(() {
              _con.isDataUploading.value = true;
            });

            vehicleDataJson json = vehicleDataJson(
              vehicle: Vehicle(
                  vfi: _bikecon.nameList[0],
                  vbi: _bikecon.nameList[1],
                  vehicleColor: _bikecon.bikeColor.value.toString(),
                  vehicleNumber: _bikecon.regNumController.text,
                  purchaseYear: _bikecon.bikeModel.text.split("-")[0]),
            );
            print(jsonEncode(json.toJson()));

            await ApiInterface()
                .uploadDriverInfo("vehicle", jsonEncode(json.toJson()))
                .then((value) {
              setState(() {
                _con.isDataUploading.value = false;
              });
              if (value == 200) {
                setState(() {
                  if (enabling == StepEnabling.sequential) {
                    ++_con.activeStep2.value;
                    if (reachedStep < _con.activeStep2.value) {
                      reachedStep = _con.activeStep2.value;
                    }
                  } else {
                    _con.activeStep2.value = reachedSteps.firstWhere(
                        (element) => element > _con.activeStep2.value);
                  }
                });
              }
            });
          } else if (_con.activeStep2.value == 2) {
            setState(() {
              _con.isDataUploading.value = true;
            });

            otherDocumentDataJson json = otherDocumentDataJson(
              others: Others(
                  cdfi: _othercon.nameList[0],
                  cdbi: _othercon.nameList[1],
                  bcd: _othercon.nameList[2]),
            );
            print(jsonEncode(json.toJson()));

            await ApiInterface()
                .uploadDriverInfo("vehicle", jsonEncode(json.toJson()))
                .then((value) {
              setState(() {
                _con.isDataUploading.value = false;
              });
              if (value == 200) {
                setState(() {
                  if (enabling == StepEnabling.sequential) {
                    ++_con.activeStep2.value;
                    if (reachedStep < _con.activeStep2.value) {
                      reachedStep = _con.activeStep2.value;
                    }
                  } else {
                    _con.activeStep2.value = reachedSteps.firstWhere(
                        (element) => element > _con.activeStep2.value);
                  }
                });
              }
            });

            // } else {
            //   if (_con.activeStep2.value < upperBound) {

            //   }
          } else if (_con.activeStep2.value == 3) {
            Get.toNamed(AppRoutes.bottomBarScreen);
          }
        });
    // return IconButton(
    //   onPressed: () {

    //   },
    //   icon: Icon(
    //     Icons.arrow_forward_ios,
    //     color: AppColors.primaryColor,
    //   ),
    // );
  }

  /// Returns the previous button.
  Widget _previousStep(StepEnabling enabling, double height, double width) {
    return PreviousButtonWidget(
        height: height,
        width: width,
        onTap: () {
          if (_con.activeStep2.value > 0) {
            setState(() => enabling == StepEnabling.sequential
                ? --_con.activeStep2.value
                : _con.activeStep2.value = reachedSteps
                    .lastWhere((element) => element < _con.activeStep2.value));
          }
        });
  }
}

enum StepEnabling { sequential, individual }
