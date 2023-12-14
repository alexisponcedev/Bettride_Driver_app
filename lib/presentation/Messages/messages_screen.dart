import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';
import 'package:taxi_booking/presentation/Messages/messages_controller.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);
  final MessageController _con = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      // extendBodyBehindAppBar: true,
      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 150),
        shrinkWrap: true,
        itemCount: _con.messageList.length,
        itemBuilder: (context, index) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 90,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: AppColors.appColor,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(_con.messageList[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _con.messageList[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          _con.messageList[index].message,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: _con.messageList[index].messageCount != ""
                                ? AppColors.textGreyColor
                                : AppColors.textGreyColor.withOpacity(.5),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        _con.messageList[index].time,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: AppColors.textGreyColor,
                          fontSize: 12,
                        ),
                      ),
                      _con.messageList[index].messageCount != ""
                          ? CircleAvatar(
                              radius: 10,
                              backgroundColor: AppColors.appColor,
                              child: Text(
                                _con.messageList[index].messageCount,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textBlackColor,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  )
                ],
              ));
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  ImageConstant.profileImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            "messages".tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textBlackColor,
            ),
          ),
          const SizedBox(
            height: 55,
            width: 55,
          ),
        ],
      ),
    );
  }
}
