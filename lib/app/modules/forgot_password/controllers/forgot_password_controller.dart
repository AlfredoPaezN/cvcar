import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController
  final emailController = TextEditingController().obs;
  GlobalKey<FormState> formForgotPass = GlobalKey<FormState>();
  Rx<bool> isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  forgotPassword() async {
    if (formForgotPass.currentState!.validate()) {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 2));
      isLoading.value = false;
      Get.back();
      Get.snackbar(
        '¡Listo!',
        'Se ha enviado un correo a ${emailController.value.text}',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
