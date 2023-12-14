import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

class PaymentComplitedScreen extends StatelessWidget {
  const PaymentComplitedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "thisweek".tr,
              style: TextStyle(
                color: AppColors.textGreyColor,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageConstant.mastarcard,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Berkay Erdinc",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "**** **** **** 2453",
                                style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color(0xff39D98A), width: 2)),
                          child: Text(
                            "paid".tr,
                            style: const TextStyle(
                              color: Color(0xff39D98A),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        commanText(header: "fee".tr, text: "\$1.42"),
                        commanText(header: "date".tr, text: "12 Aug 2020"),
                        const SizedBox(width: 20),
                        commanText(header: "total".tr, text: "\$25.00")
                      ],
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget commanText({
    required String header,
    required String text,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.textGreyColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.textBlackColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
