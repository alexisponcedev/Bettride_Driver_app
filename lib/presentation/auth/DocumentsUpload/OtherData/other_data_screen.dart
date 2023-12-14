import 'package:flutter/material.dart';
import 'package:taxi_booking/core/Common/commons.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/auth/DocumentsUpload/OtherData/other_data_controller.dart';
import 'package:taxi_booking/presentation/auth/DocumentsUpload/PersonalData/upload_personal_data.dart';
import 'package:taxi_booking/presentation/auth/DocumentsUpload/PersonalData/upload_personal_data_controller.dart';

class uploadOtherData extends StatefulWidget {
  const uploadOtherData({super.key});

  @override
  State<uploadOtherData> createState() => _uploadOtherDataState();
}

class _uploadOtherDataState extends State<uploadOtherData> {
  final UploadOtherController _con = Get.put(UploadOtherController());
  final UploadBikePersonalController _dcon =
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
                    title: "Card document front image",
                    onTap: () async {
                      _con.iscardDocumentFrontImageLoading.value = true;
                      _con.onCameraClick(upladedPersonalImages.cardFront);
                    },
                  ),
                  _con.cardDocumentFrontImage.value == ""
                      ? const SizedBox()
                      : Document_card_widget(
                          con: _dcon,
                          loading: _con.iscardDocumentBackImageLoading,
                          path: _con.cardDocumentFrontImage.toString(),
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
                    title: "Card document back imagee",
                    onTap: () async {
                      _con.iscardDocumentBackImageLoading.value = true;
                      _con.onCameraClick(upladedPersonalImages.cardBack);
                    },
                  ),
                  _con.cardDocumentBackImage.value == ""
                      ? const SizedBox()
                      : Document_card_widget(
                          con: _dcon,
                          loading: _con.iscardDocumentBackImageLoading,
                          path: _con.cardDocumentBackImage.toString(),
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
                    title: "BC document",
                    onTap: () async {
                      _con.isBCDImageLoading.value = true;
                      _con.onCameraClick(upladedPersonalImages.bcdImage);
                    },
                  ),
                  _con.BCDImage.value == ""
                      ? const SizedBox()
                      : Document_card_widget(
                          con: _dcon,
                          loading: _con.isBCDImageLoading,
                          path: _con.BCDImage.toString(),
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
