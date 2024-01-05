import 'package:cvcar_mobile/app/models/vehicle.dart';
import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppNavigationController extends GetxController {
  AuthController authController;
  AppNavigationController({required this.authController});
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  RxInt pageIndexSelected = 0.obs;
  RxString currentPageName = ''.obs;

  final vehiclesAssigned = TextEditingController().obs;

  Rxn<List<DropdownMenuItem<String>>> availableVehicles =
      Rxn<List<DropdownMenuItem<String>>>();

  @override
  void onInit() {
    getVehicleList(authController.vehiclesData.value);
    if (authController.vehiclesData.value == null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => Get.toNamed(Routes.WELCOME));
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getVehicleList(List<Vehicle>? vehicles) {
    print("charging vehicles");
    availableVehicles.value = [
      ...vehicles?.map((e) {
            return DropdownMenuItem(
              child: Text(e.brand!.name! +
                  ' ' +
                  e.modelYear.toString() +
                  ' ' +
                  e.plate!),
              value: e.brand!.name! +
                  ' ' +
                  e.modelYear.toString() +
                  ' ' +
                  e.plate!,
            );
          }).toList() ??
          [],
      const DropdownMenuItem(
        child: Text('+ Agregar nuevo vehículo'),
        value: '+ Agregar nuevo vehículo',
      ),
    ];
  }

  @override
  void onClose() {
    super.onClose();
  }
}
