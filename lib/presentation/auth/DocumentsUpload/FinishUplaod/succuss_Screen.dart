import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_booking/core/app_export.dart';

class successScreen extends StatefulWidget {
  const successScreen({super.key});

  @override
  State<successScreen> createState() => _successScreenState();
}

class _successScreenState extends State<successScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            "Thank You",
            style: TextStyle(
                color: AppColors.textBlackColor,
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "Your data has been submitted for review have a great day!!!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          SizedBox(
              height: height * 0.3,
              child:
                  Lottie.asset("assets/animations/done.json", fit: BoxFit.fill))
        ],
      ),
    );
  }
}
