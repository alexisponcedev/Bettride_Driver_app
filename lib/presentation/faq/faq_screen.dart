import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/app_bar.dart';
import 'package:taxi_booking/presentation/commonWidgets/expansion.dart';
import 'package:taxi_booking/presentation/faq/faq_controller.dart';

class FAQScreen extends StatelessWidget {
  FAQScreen({Key? key}) : super(key: key);
  final FAQController _con = Get.put(FAQController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: "faq".tr, back: true),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                ImageConstant.faqbg,
                height: 200,
                width: 200,
              ),
              ListView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: Get.width * 0.02),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (_con.isselect.contains(index)) {
                                  _con.isselect.remove(index);
                                } else {
                                  _con.isselect.add(index);
                                }
                              },
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                width: Get.width,
                                height: Get.height * 0.1,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "pineapplerelatedquestions".tr,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.textBlackColor,
                                          ),
                                        ),
                                        const Text("")
                                        // Text(
                                        //   "Beza Building, aadis 4586",
                                        //   style: TextStyle(
                                        //     fontSize: 14,
                                        //     fontWeight: FontWeight.w400,
                                        //     color: AppColors.textGreyColor,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightBlue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: _con.isselect.contains(index)
                                          ? const Icon(
                                              Icons.expand_less,
                                              color: Colors.black,
                                            )
                                          : const Icon(
                                              Icons.expand_more,
                                              color: Colors.black,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ExpandedSection(
                              expand: _con.isselect.contains(index),
                              child: Center(
                                child: Container(
                                  width: Get.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(14),
                                      bottomRight: Radius.circular(14),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 30, bottom: 30),
                                    child: Text(
                                      "loremipsumdolorsitconsecteturadipiscingelitintegerpretiumelitidmollisornare"
                                          .tr,
                                      style: TextStyle(
                                        height: 2,
                                        color: AppColors.textBlackColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
