import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppNavigationController extends GetxController {
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  RxInt pageIndexSelected = 0.obs;
  RxString currentPageName = ''.obs;

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
