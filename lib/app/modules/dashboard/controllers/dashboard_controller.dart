import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final vehiclesAssigned = TextEditingController().obs;

  List<DropdownMenuItem<String>> availableVehicles = [
    const DropdownMenuItem(
      child: Text('Mazda Allegro'),
      value: 'Mazda Allegro',
    ),
    const DropdownMenuItem(
      child: Text('Mazda 3'),
      value: 'Mazda 3',
    ),
    const DropdownMenuItem(
      child: Text('+ Agregar nuevo vehículo'),
      value: '+ Agregar nuevo vehículo',
    ),
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
}
