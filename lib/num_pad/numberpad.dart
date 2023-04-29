import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// KeyPad widget
// This widget is reusable and its buttons are customizable (color, size)
class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;

  const NumPad({
    Key? key,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    required this.delete,
    required this.onSubmit,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // implement the number keys (from 0 to 9) with the NumberButton widget
            // the NumberButton widget is defined in the bottom of this file
            children: [
              NumberButton(
                number: 1,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: 2,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: 3,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 4,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: 5,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: 6,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 7,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: 8,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: 9,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // this button is used to delete the last number
              NeumorphicButton(
                style:  Get.isDarkMode ? NeumorphicStyle(
                  color: Color(0xFF292D32),
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              ) : NeumorphicStyle(
                  color: Colors.white,
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                ),
                onPressed: () => delete(),
                child: Icon(
                  Icons.backspace,
                  color: iconColor,
                  size: 35,
                ),
              ),
              NumberButton(
                number: 0,
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              // this button is used to submit the entered value

              NeumorphicButton(
                onPressed: () => onSubmit(),
                child: Icon(
                  Icons.done_rounded,
                  color: iconColor,
                  size: 35,
                ),
                style: Get.isDarkMode ? NeumorphicStyle(
                  color: Color(0xFF292D32),
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                ) : NeumorphicStyle(
                  color: Colors.white,
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
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
  final int number;
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
      child: (Get.isDarkMode) ? NeumorphicButton(
        style: NeumorphicStyle(
          color: Color(0xFF292D32),
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        ),
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: color,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(size / 2),
        //   ),
        // ),
        onPressed: () {
          controller.text += number.toString();
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.w400, color: Colors.white, fontSize: 30),
          ),
        ),
      ) :  NeumorphicButton(
        style: NeumorphicStyle(
          color: Colors.white,
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        ),
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: color,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(size / 2),
        //   ),
        // ),
        onPressed: () {
          controller.text += number.toString();
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.w400, color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }
}



