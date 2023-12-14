import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/app_export.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? prefixIcon;
  final bool? icon;
  final String? keyValue;
  final String? hintText;
  final String? initialValue;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final bool obsecureText;
  final bool border;
  final bool shadow;
  final TextInputType keyboardType;
  final int maxLines;
  final Color? color;
  final List<TextInputFormatter>? inputFormatters;
  final RxString errorMessage;
  final bool readonly;
  final Function()? ontap;
  final double? radius;

  const AppTextField({
    Key? key,
    this.keyValue = "1",
    this.hintText,
    this.initialValue,
    this.validate,
    this.onChange,
    this.obsecureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.color,
    this.border = false,
    this.shadow = false,
    this.prefixIcon,
    this.inputFormatters,
    this.controller,
    required this.errorMessage,
    this.readonly = false,
    this.ontap,
    this.radius,
    this.icon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            // border:
            //     border == true ? Border.all(color: AppColors.appColor) : null,
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 10),
            boxShadow: shadow
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ]
                : [],
          ),

          child: TextFormField(
            onTap: ontap,
            readOnly: readonly,
            controller: controller,
            onChanged: onChange,
            inputFormatters: inputFormatters,
            cursorColor: AppColors.primaryColor,
            obscureText: obsecureText,
            maxLines: maxLines,
            decoration: InputDecoration(
              labelText: hintText,
              labelStyle: const TextStyle(
                color: Color(0xff8B8989),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: icon == true
                  ? prefixIcon != null
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Image.asset(
                                prefixIcon!,
                                height: 30,
                                width: 30,
                                color: AppColors.appIconColor,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5, right: 20),
                              height: 20,
                              width: 2,
                              decoration: const BoxDecoration(
                                color: Color(0xffC3CDDB),
                              ),
                            ),
                          ],
                        )
                      : null
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          prefixIcon!,
                          style: TextStyle(
                            color: AppColors.numColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          height: 20,
                          width: 2,
                          decoration: const BoxDecoration(
                            color: Color(0xffC3CDDB),
                          ),
                        ),
                      ],
                    ),

              suffixIcon: suffixIcon
              //  != null
              //     ? Padding(
              //         padding: const EdgeInsets.all(14),
              //         child: Image.asset(
              //           suffixIcon!,
              //           height: 15,
              //           width: 15,
              //           // color: AppColors.authIconColor,
              //         ),
              //       )
              //     : null,
              ,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 15.0,
                // color: AppColors.hintTextColor,
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(radius ?? 10),
              //   borderSide: BorderSide(color: Colors.teal),
              // ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.teal, width: 2),
                borderRadius: BorderRadius.circular(radius ?? 10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.appColor, width: 2),
                borderRadius: BorderRadius.circular(radius ?? 10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor, width: 2),
                borderRadius: BorderRadius.circular(radius ?? 10),
              ),
            ),
          ),
        ),
        Obx(
          () => (errorMessage.value.isNotEmpty)
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 25,
                    color: Colors.transparent,
                    child: Text(
                      errorMessage.value,
                      style: const TextStyle(color: Colors.red, fontSize: 11),
                    ),
                  ),
                )
              : Container(),
        )
      ],
    );
  }
}
