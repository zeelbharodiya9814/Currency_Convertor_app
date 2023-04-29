import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool dark = false;

  themeMode(bool val) {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    dark = val;
    update();
  }
}
