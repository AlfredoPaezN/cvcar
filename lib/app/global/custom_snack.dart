import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void errorMessage(String title, String description) {
  Get.snackbar(
    title,
    description,
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    backgroundColor: Colors.red.withOpacity(0.80),
    isDismissible: true,
    icon: Icon(
      Icons.error_outline_sharp,
      size: 26.sp,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    reverseAnimationCurve: Curves.easeOutCirc,
  );
}

void infoMessage(String title, String description) {
  Get.snackbar(
    title,
    description,
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    backgroundColor: Colors.blue.withOpacity(0.80),
    isDismissible: true,
    icon: Icon(
      Icons.info_outlined,
      size: 26.sp,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    reverseAnimationCurve: Curves.easeOutCirc,
  );
}

void warningMessage(String title, String description) {
  Get.snackbar(
    title,
    description,
    colorText: Colors.black,
    duration: const Duration(seconds: 4),
    backgroundColor: Colors.amber.withOpacity(0.80),
    isDismissible: true,
    icon: Icon(
      Icons.warning_amber_rounded,
      size: 26.sp,
      color: Colors.black,
    ),
    shouldIconPulse: false,
    reverseAnimationCurve: Curves.easeOutCirc,
  );
}
