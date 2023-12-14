import 'package:flutter/material.dart';

Widget searchBox(
    {required String hint,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool boxShadow = false,
    TextEditingController? controller}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(left: 15),
    height: 55,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: boxShadow == true
          ? [
              BoxShadow(
                color: const Color(0xff707070).withOpacity(.2),
                blurRadius: 10,
              ),
            ]
          : [],
    ),
    child: TextFormField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 13,
          color: Colors.black.withOpacity(.5),
        ),
        border: InputBorder.none,
      ),
    ),
  );
}
