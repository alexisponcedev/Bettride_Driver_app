import 'package:flutter/material.dart';
import 'package:taxi_booking/core/app_export.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Poppins',
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Poppins',
        ),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: AppColors.lightBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBlue,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: const TextStyle(color: Colors.black),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Poppins',
        ),
    primaryTextTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Poppins',
        ),
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
