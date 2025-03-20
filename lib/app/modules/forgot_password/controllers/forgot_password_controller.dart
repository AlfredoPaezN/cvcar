import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController
  final emailController = TextEditingController().obs;
  GlobalKey<FormState> formForgotPass = GlobalKey<FormState>();
  Rx<bool> isLoading = false.obs;
  AuthController authController;

  ForgotPasswordController({required this.authController});

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  forgotPassword() async {
    if (formForgotPass.currentState!.validate()) {
      isLoading.value = true;
      final response =
          await authController.sendEmailForgotPass(emailController.value.text);
      isLoading.value = false;
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        Get.back();
        Get.snackbar(
          '¡Listo!',
          'Se ha enviado un correo a ${emailController.value.text}',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          '¡Error! No se ha podido enviar el correo',
          response.body['message'] ?? '',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
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
