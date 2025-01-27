import 'package:flutter/material.dart';
import 'package:taxi_booking/core/utils/app_color.dart';

class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;

  const NumPad({
    Key? key,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    required this.delete,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // implement the number keys (from 0 to 9) with the NumberButton widget
            // the NumberButton widget is defined in the bottom of this file
            children: [
              NumberButton(
                number: "1",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: "2",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: "3",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumberButton(
                number: "4",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: "5",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: "6",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumberButton(
                number: "7",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: "8",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: "9",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // this button is used to delete the last number
              // InkWell(
              //   onTap: () => onSubmit(),
              //   borderRadius: BorderRadius.circular(10),
              //   child: Container(
              //     height: buttonSize,
              //     width: buttonSize,
              //     child: Icon(
              //       Icons.done_rounded,
              //       color: iconColor,
              //       size: 24,
              //     ),
              //   ),
              // ),
              NumberButton(
                number: ".",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),

              NumberButton(
                number: "0",
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              // this button is used to submit the entered value

              InkWell(
                onTap: () {
                  delete();
                },
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: buttonSize,
                  width: buttonSize,
                  child: Icon(
                    Icons.backspace,
                    color: AppColors.numColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// define NumberButton widget
// its shape is round
class NumberButton extends StatelessWidget {
  final String number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        onTap: () {
          controller.text += number.toString();
        },
        borderRadius: BorderRadius.circular(10),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.numColor,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
