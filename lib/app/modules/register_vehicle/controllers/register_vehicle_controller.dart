import 'package:cvcar_mobile/app/global/custom_snack.dart';
import 'package:cvcar_mobile/app/models/vehicle.dart';
import 'package:cvcar_mobile/app/modules/app_navigation/controllers/app_navigation_controller.dart';
import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/service/register_vehicle_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterVehicleController extends GetxController {
  AuthController authController;
  VehicleService registerVehicleService;
  AppNavigationController appNavigationController;
  RegisterVehicleController(
      {required this.authController,
      required this.registerVehicleService,
      required this.appNavigationController});

  GlobalKey<FormState> formRegisterVehicle = GlobalKey<FormState>();
  Rx<bool> isLoading = false.obs;

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
    // const DropdownMenuItem(
    //   child: Text('Cédula de extranjería'),
    //   value: 'Cédula de extranjería',
    // ),
  ];
// "229f569b-ee31-4d94-9606-8c3ce8eac8f9"

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

  createVehicle(context) async {
    isLoading.value = true;
    if (formRegisterVehicle.currentState!.validate() &&
        personalData.value &&
        termsAndConditions.value) {
      FocusScope.of(context).unfocus();
      Response response = await registerVehicleService.createVehicle({
        "plate": vehiclePlate.value.text,
        "driving": authController.drivinData.value?.id,
        "idTypeDocument": "229f569b-ee31-4d94-9606-8c3ce8eac8f9",
        "numberDocument": documenNumber.value.text,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        await getVehicle();
        Get.offAndToNamed(Routes.APP_NAVIGATION);
      } else {
        errorMessage('${response.body['message'][0]['message']}', "");
      }
    }
    isLoading.value = false;
  }

  getVehicle() async {
    isLoading.value = true;
    List<Vehicle> tempList = await registerVehicleService.getVehicle(
          authController.drivinData.value?.id,
        ) ??
        [];
    authController.vehiclesData.value = tempList;
    appNavigationController.getVehicleList(tempList);
    isLoading.value = false;
  }
}
