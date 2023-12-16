import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  final confirmPassController = TextEditingController().obs;
  final documenType = TextEditingController().obs;
  final documenNumber = TextEditingController().obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  GlobalKey<FormState> formRegister = GlobalKey<FormState>();
  bool isValidFormCreateDriverOne() {
    return formRegister.currentState!.validate();
  }

  List<DropdownMenuItem<String>> documenTypeItemList = [
    const DropdownMenuItem(
      child: Text('Cédula de ciudadanía'),
      value: 'Cédula de ciudadanía',
    ),
    const DropdownMenuItem(
      child: Text('Cédula de extranjería'),
      value: 'Cédula de extranjería',
    ),
    const DropdownMenuItem(
      child: Text('Pasaporte'),
      value: 'Pasaporte',
    ),
    // const DropdownMenuItem(
    //   child: Text('Tarjeta de identidad'),
    // ),
    // const DropdownMenuItem(
    //   child: Text('Registro civil'),
    // ),
    // const DropdownMenuItem(
    //   child: Text('NIT'),
    // ),
    // const DropdownMenuItem(
    //   child: Text('RUT'),
    // ),
  ];
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

  seeConfirmPassword() {
    return isConfirmPasswordVisible.value
        ? IconButton(
            onPressed: () {
              isConfirmPasswordVisible.value = false;
            },
            icon: const Icon(
              Icons.visibility,
              color: Color(CVCarColors.greyLight),
            ))
        : IconButton(
            onPressed: () {
              isConfirmPasswordVisible.value = true;
            },
            icon: const Icon(
              Icons.visibility_off,
              color: Color(CVCarColors.greyLight),
            ),
          );
  }
}
