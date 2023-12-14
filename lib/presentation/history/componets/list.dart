import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/commonWidgets/expansion.dart';
import 'package:taxi_booking/presentation/history/history_controller.dart';

class Listview extends StatelessWidget {
  Listview({Key? key}) : super(key: key);
  final HistoryController _con = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 150),
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
              margin: EdgeInsets.symmetric(vertical: Get.width * 0.02),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "705 Green Summit",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlackColor,
                                ),
                              ),
                              Text(
                                "Beza Building, aadis 4586",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textGreyColor,
                                ),
                              ),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: Get.width * 0.04),
                              Column(
                                children: [
                                  Container(
                                    height: 130,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: AppColors.lightBlue,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  SizedBox(height: Get.width * 0.06),
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImageConstant.history,
                                        height: 18,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        "43 min",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textBlackColor,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Image.asset(
                                        ImageConstant.distance2,
                                        height: 18,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        "43 min",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textBlackColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: Get.width * 0.06),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
