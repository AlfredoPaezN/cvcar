import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  RxBool isPasswordVisible = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  seePassword() {
    return isPasswordVisible.value
        ? IconButton(
            onPressed: () {
              isPasswordVisible.value = false;
            },
            icon: const Icon(
              Icons.visibility,
              color: Color(CVCarColors.greyLight),
            ))
        : IconButton(
            onPressed: () {
              isPasswordVisible.value = true;
            },
            icon: const Icon(
              Icons.visibility_off,
              color: Color(CVCarColors.greyLight),
            ),
          );
  }

  revealPassword() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.remove_red_eye_outlined),
    );
  }

  void increment() => count.value++;
}
