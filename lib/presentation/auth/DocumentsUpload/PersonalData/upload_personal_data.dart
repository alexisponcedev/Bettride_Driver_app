import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taxi_booking/core/Common/commons.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/auth/DocumentsUpload/PersonalData/upload_personal_data_controller.dart';

class uploadPersonalData extends StatefulWidget {
  const uploadPersonalData({super.key});

  @override
  State<uploadPersonalData> createState() => _uploadPersonalDataState();
}

class _uploadPersonalDataState extends State<uploadPersonalData> {
  final UploadBikePersonalController _con =
      Get.put(UploadBikePersonalController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

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
                    title: "Profile Image",
                    onTap: () async {
                      _con.isProfileLoading.value = true;
                      _con.onCameraClick(upladedPersonalImages.profile);
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          _con.isProfileLoading.value = false;
                        });
                      });
                    },
                  ),
                  _con.ProfileImage.value == ""
                      ? const SizedBox()
                      : Document_card_widget(
                          con: _con,
                          loading: _con.isProfileLoading,
                          path: _con.ProfileImage.toString(),
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
                    title: "Bike license front image",
                    onTap: () async {
                      _con.isLicenceFrontLoading.value = true;
                      _con.onCameraClick(upladedPersonalImages.licenseFront);
                    },
                  ),
                  _con.licenseFrontImage.value == ""
                      ? const SizedBox()
                      : Document_card_widget(
                          con: _con,
                          loading: _con.isLicenceFrontLoading,
                          path: _con.licenseFrontImage.toString(),
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
                    title: "Bike license back image",
                    onTap: () async {
                      _con.isLicenceBackLoading.value = true;
                      _con.onCameraClick(upladedPersonalImages.licenseBack);
                    },
                  ),
                  _con.licenseBackImage.value == ""
                      ? const SizedBox()
                      : Document_card_widget(
                          con: _con,
                          loading: _con.isLicenceBackLoading,
                          path: _con.licenseBackImage.toString(),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Document_card_widget extends StatelessWidget {
  Document_card_widget({
    super.key,
    required UploadBikePersonalController con,
    required this.path,
    required this.loading,
  }) : _con = con;

  final UploadBikePersonalController _con;
  String path;
  RxBool loading;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        elevation: 1,
        child: ListTile(
            leading: Image.file(
              File(path.toString()),
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            title: FutureBuilder<String>(
              future: _con.getName(path), // async work
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Text('Loading....');
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        '${snapshot.data}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.textBlackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        ),
                      );
                    }
                }
              },
            ),
            subtitle: loading.value
                ? const LinearProgressIndicator()
                : const SizedBox(),
            trailing: Image.asset(
              loading.value ? ImageConstant.cancel : ImageConstant.ok,
              height: 20,
              width: 20,
            )),
      ),
    );
  }
}

class upload_documents_title extends StatelessWidget {
  VoidCallback onTap;
  String title;

  upload_documents_title({
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr,
          style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
        ),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Icon(
                Icons.add_circle_outline_sharp,
                color: AppColors.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Add",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// class choose_image_widget extends StatelessWidget {
//   choose_image_widget(
//       {super.key,
//       required UploadBikePersonalController con,
//       required this.width,
//       required this.title,
//       required this.path})
//       : _con = con;

//   final UploadBikePersonalController _con;
//   final double width;
//   String title;
//   String path;

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: const BoxConstraints(maxWidth: double.infinity),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           path == ""
//               ? Text(
//                   title,
//                   style: TextStyle(
//                     color: AppColors.textBlackColor,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w200,
//                   ),
//                 )
//               : SizedBox(
//                   width: width * 0.5,
//                   child: FutureBuilder<String>(
//                     future: _con.getName(path), // async work
//                     builder:
//                         (BuildContext context, AsyncSnapshot<String> snapshot) {
//                       switch (snapshot.connectionState) {
//                         case ConnectionState.waiting:
//                           return const Text('Loading....');
//                         default:
//                           if (snapshot.hasError) {
//                             return Text('Error: ${snapshot.error}');
//                           } else {
//                             return Text(
//                               '${snapshot.data}',
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 color: AppColors.textBlackColor,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w200,
//                               ),
//                             );
//                           }
//                       }
//                     },
//                   ),
//                 ),
//           TextButton(
//               onPressed: () {
//                 _con.onCameraClick();
//               },
//               child: Text(
//                 "Choose Picture",
//                 style: TextStyle(color: AppColors.primaryColor),
//               ))
//         ],
//       ),
//     );
//   }
// }
