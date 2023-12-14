import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/core/utils/helper.dart';
import 'package:taxi_booking/core/widgets/next_button_widget.dart';
import 'package:taxi_booking/presentation/auth/getUserData/getUserDataController.dart';

class GetUserData extends StatefulWidget {
  const GetUserData({super.key});

  @override
  State<GetUserData> createState() => _GetUserDataState();
}

class _GetUserDataState extends State<GetUserData> {
  final GetUserDataController _con = Get.put(GetUserDataController());
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Enter your detail".tr,
            style: TextStyle(
              color: AppColors.textBlackColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Full Name".tr,
                        style: TextStyle(color: AppColors.greyColor),
                      )),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, right: 8.0, left: 8.0),
                    child: TextFormField(
                      cursorColor: AppColors.primaryColor,
                      textAlignVertical: TextAlignVertical.center,
                      controller: _con.nameController,
                      validator: Helper.validateName,
                      // onSaved: (String? val) {
                      //   firstName = val;
                      // },
                      textInputAction: TextInputAction.next,

                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        fillColor: Colors.white,
                        hintText: ('Full Name'.tr),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 2.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
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
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Phone Number".tr,
                        style: TextStyle(color: AppColors.greyColor),
                      )),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, right: 8.0, left: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.grey.shade200)),
                      child: InternationalPhoneNumberInput(
                        validator: Helper.validateEmpty,
                        textFieldController: _con.numberController,
                        onInputChanged: (PhoneNumber number) {
                          // .substring(number.dialCode!.length);
                          _con.countryCode.value =
                              number.dialCode!.toString().substring(1);
                        },

                        // onInputValidated: (bool value) => _isPhoneValid = value,
                        ignoreBlank: true,
                        autoValidateMode: AutovalidateMode.disabled,
                        inputDecoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(2),
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
                        initialValue: PhoneNumber(isoCode: 'PK'),
                        selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email".tr,
                        style: TextStyle(color: AppColors.greyColor),
                      )),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, right: 8.0, left: 8.0),
                    child: TextFormField(
                      cursorColor: AppColors.primaryColor,
                      textAlignVertical: TextAlignVertical.center,
                      controller: _con.emailController,
                      validator: Helper.validateEmail,
                      // onSaved: (String? val) {
                      //   firstName = val;
                      // },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        fillColor: Colors.white,
                        hintText: ('Enter your email address'.tr),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 2.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
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
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "City".tr,
                        style: TextStyle(color: AppColors.greyColor),
                      )),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, right: 8.0, left: 8.0),
                    child: TextFormField(
                      cursorColor: AppColors.primaryColor,
                      textAlignVertical: TextAlignVertical.center,
                      controller: _con.cityController,
                      validator: Helper.validateEmpty,
                      // onSaved: (String? val) {
                      //   firstName = val;
                      // },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        fillColor: Colors.white,
                        hintText: ('Enter your City name'.tr),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 2.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
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
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Gender".tr,
                        style: TextStyle(color: AppColors.greyColor),
                      )),
                ),
                Obx(
                  () => ListTile(
                    title: Text('Male'.tr),
                    leading: Radio(
                      value: 1,
                      groupValue: _con.selectedGender.value,
                      onChanged: (v) {
                        _con.selectedGender.value = v!;
                      },
                    ),
                  ),
                ),
                Obx(
                  () => ListTile(
                    title: Text('Female'.tr),
                    leading: Radio(
                      value: 2,
                      groupValue: _con.selectedGender.value,
                      onChanged: (v) {
                        _con.selectedGender.value = v!;
                      },
                    ),
                  ),
                ),
                Obx(
                  () => ListTile(
                    title: Text('Other'.tr),
                    leading: Radio(
                      value: 3,
                      groupValue: _con.selectedGender.value,
                      onChanged: (v) {
                        _con.selectedGender.value = v!;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Date of birth".tr,
                        style: TextStyle(color: AppColors.greyColor),
                      )),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0, left: 8.0, top: 8),
                    child: TextFormField(
                      controller: _con.dateInput,
                      validator: Helper.validateEmpty,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        fillColor: Colors.white,
                        hintText: ('Enter your  DOB'.tr),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 2.0)),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
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
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime.now());

                        if (pickedDate != null) {
                          DateTime minAgeDate = DateTime.now().subtract(
                              const Duration(
                                  days: 365 * 18 +
                                      1)); // Note the addition of one day
                          if (pickedDate.isBefore(minAgeDate)) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            _con.dateInput.text = formattedDate;
                          } else {
                            Get.snackbar("Soryy!!".tr, 'age_warning'.tr,
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Obx(
          () => nextButtonWidget(
              height: height,
              width: width,
              loading: _con.apiLoading.value,
              onTap: () {
                if (_key.currentState?.validate() ?? false) {
                  _key.currentState!.save();
                  _con.registerUser();
                  // Get.toNamed(AppRoutes.otpFiledScreen, arguments: {
                  //   "from_signup": true,
                  //   "phone": _con.phoneNumber,
                  //   "email": _con.emailController.text
                  // });
                  // Get.toNamed(AppRoutes.documentUplaodScreen);
                  // Get.toNamed(AppRoutes.TermAndConditionsScreen);
                }
              }),
        ));
  }
}
