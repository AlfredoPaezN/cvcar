import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterVehicleController extends GetxController {
  //TODO: Implement RegisterVehicleController

  final vehiclePlate = TextEditingController().obs;
  final documenType = TextEditingController().obs;
  final documenNumber = TextEditingController().obs;
  RxBool termsAndConditions = false.obs;
  RxBool personalData = false.obs;
  RxBool isPropetary = true.obs;

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

  void increment() => count.value++;
}
