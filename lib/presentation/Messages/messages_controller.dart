import 'package:taxi_booking/core/app_export.dart';

class MessageController extends GetxController {
  RxList<Messages> messageList = RxList([
    Messages(
      image: ImageConstant.profileImage,
      message: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
      messageCount: "3",
      name: "Konsta Peura",
      time: "01:56",
    ),
    Messages(
      image: ImageConstant.profileImage,
      message: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
      messageCount: "",
      name: "Konsta Peura",
      time: "01:56",
    ),
    Messages(
      image: ImageConstant.profileImage,
      message: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
      messageCount: "3",
      name: "Konsta Peura",
      time: "01:56",
    ),
    Messages(
      image: ImageConstant.profileImage,
      message: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
      messageCount: "3",
      name: "Konsta Peura",
      time: "01:56",
    ),
    Messages(
      image: ImageConstant.profileImage,
      message: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
      messageCount: "3",
      name: "Konsta Peura",
      time: "01:56",
    ),
    Messages(
      image: ImageConstant.profileImage,
      message: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
      messageCount: "3",
      name: "Konsta Peura",
      time: "01:56",
    ),
    Messages(
      image: ImageConstant.profileImage,
      message: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
      messageCount: "3",
      name: "Konsta Peura",
      time: "01:56",
    ),
    Messages(
      image: ImageConstant.profileImage,
      message: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
      messageCount: "3",
      name: "Konsta Peura",
      time: "01:56",
    ),
    Messages(
      image: ImageConstant.profileImage,
      message: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
      messageCount: "3",
      name: "Konsta Peura",
      time: "01:56",
    ),
    Messages(
      image: ImageConstant.profileImage,
      message: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
      messageCount: "3",
      name: "Konsta Peura",
      time: "01:56",
    )
  ]);
}

class Messages {
  String name;
  String message;
  String time;
  String image;
  String messageCount;

  Messages({
    required this.image,
    required this.message,
    required this.messageCount,
    required this.name,
    required this.time,
  });
}
