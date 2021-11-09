import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color kPrimaryLightColor = Color(0xFFFFFFFF);
const Color kSecondaryLightColor = Colors.orange;
const Color kPrimaryDarkColor = Colors.black;
const Color kSecondaryDarkColor = Color(0xff28282B);
const Color kErrorColor = Color(0xffB00020);

showErrorSnackBar(String message) {
  Get.snackbar(
    'Error',
    message.toString(),
    colorText: Colors.white,
    backgroundColor: kErrorColor,
    duration: 3.seconds,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    isDismissible: true,
  );
}
