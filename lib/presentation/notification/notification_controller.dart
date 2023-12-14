import 'package:taxi_booking/core/app_export.dart';

class NotificationController extends GetxController {
  RxBool notification = false.obs;
  List notificationList = [
    {
      "image": ImageConstant.coupon,
      "header": "promotion".tr,
      "subText": "invtefriendsyougot25gift".tr,
      "time": "1 min ago",
    },
    {
      "image": ImageConstant.mastarcard,
      "header": "newpaymentmethod".tr,
      "subText": "hasbeenaddedsuccessfuly".tr,
      "time": "10 min ago",
    },
    {
      "image": ImageConstant.account,
      "header": "system".tr,
      "subText": "thankyouyourtransactionis".tr,
      "time": "14 h ago",
    },
    {
      "image": ImageConstant.profileImage,
      "header": "joesmith".tr,
      "subText": "helloithinkyouleftyourbag".tr,
      "time": "2 h ago",
    }
  ];
}
