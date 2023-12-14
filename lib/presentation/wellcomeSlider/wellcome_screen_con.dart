import 'package:carousel_slider/carousel_controller.dart';
import 'package:taxi_booking/core/app_export.dart';

class WelcomeController extends GetxController {
  RxInt currentCarouselIndex = 0.obs;
  CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  RxList<Welcome> welcomeList = RxList([
    Welcome(
      image: ImageConstant.welcome,
      title: "chosetheroute".tr,
      subtitle:
          "loremipsumissimplydummytextoftheprintingandtypesettingindustry".tr,
    ),
    Welcome(
      image: ImageConstant.splash2,
      title: "requestride".tr,
      subtitle:
          "itisalongestablishedfactthatareaderwillbedistractedbythereadablecontentofapagewhenlookingatitslayout"
              .tr,
    ),
    Welcome(
      image: ImageConstant.splash3,
      title: "getyourtaxi".tr,
      subtitle:
          "ifyouaregoingtouseapassageofloremipsumyouneedtobesurethereisntanythingembarrassinghiddeninthemiddleoftext"
              .tr,
    ),
    Welcome(
      image: ImageConstant.splash4,
      title: "saveyourtime".tr,
      subtitle:
          "alltheloremipsumgeneratorsontheinternettendtorepeatpredefinedchunksasnecessarymakingthisthefirsttruegeneratorontheinternet"
              .tr,
    )
  ]);
}

class Welcome {
  String title;
  String subtitle;
  String? image;
  Welcome({required this.title, required this.subtitle, this.image});
}
