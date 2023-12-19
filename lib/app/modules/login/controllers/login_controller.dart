import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  RxBool isPasswordObscured = true.obs;

  GlobalKey<FormState> formLogin = GlobalKey<FormState>();
  Rx<bool> isLoading = false.obs;

  AuthController authController;
  LoginController({required this.authController});

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

  bool isValidFormCreateDriverOne() {
    return formLogin.currentState!.validate();
  }

  seePassword() {
    return isPasswordObscured.value
        ? IconButton(
            onPressed: () {
              isPasswordObscured.value = false;
            },
            icon: const Icon(
              Icons.visibility,
              color: Color(CVCarColors.greyLight),
            ))
        : IconButton(
            onPressed: () {
              isPasswordObscured.value = true;
            },
            icon: const Icon(
              Icons.visibility_off,
              color: Color(CVCarColors.greyLight),
            ),
          );
  }

  Future<void> login() async {
    isLoading.value = true;
    if (formLogin.currentState!.validate()) {
      await authController.login(
          emailController.value.text, passController.value.text);
    }

    isLoading.value = false;
  }
}
