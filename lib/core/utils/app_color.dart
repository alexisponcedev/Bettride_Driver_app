import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = fromHex('#E4002B');
  static Color appColor = fromHex('#E4002B');
  static Color lightappColor = fromHex('#f28095');
  static Color borderColor = fromHex('#E0E4F5');
  static Color secondaryColor = fromHex('#261854');
  static Color textGreyColor = fromHex('#8B8989');
  static Color textBlueColor = fromHex('#4B545A');
  static Color numColor = fromHex('#5A6274');
  static Color appIconColor = fromHex('#B8BABF');
  static Color textBlackColor = fromHex('#0F0B03');
  static Color textWhiteColor = fromHex('#FFFFFF');
  static Color lightBlue = fromHex('#F4F5FA');
  static Color cyanColor = fromHex('#4DEEEC');
  static Color gradient1 = fromHex('#22B0FF');
  static Color gradient2 = fromHex('#ABFEBA');
  static Color greenColor = fromHex('#39F5BB');
  static Color yellowColor = fromHex('#F7E584');
  static Color jetBlackColor = fromHex('#343434');
  static Color greyColor = Colors.grey;

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
