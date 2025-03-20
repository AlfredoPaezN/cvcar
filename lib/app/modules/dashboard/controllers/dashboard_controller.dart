import 'package:cvcar_mobile/app/global/custom_indicator.dart';
import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  AuthController authController;
  DashboardController({required this.authController});
  Rxn<List<Map<String, dynamic>>> categories =
      Rxn<List<Map<String, dynamic>>>();

  @override
  void onInit() {
    getCategoriesStatus();
    super.onInit();
  }

  getCategoriesStatus() {
    categories.value = [
      {
        "image": "assets/categories/SOAT.png",
        "title": "SOAT",
        "status": getSoatStatusText(),
      },
      {
        "image": "assets/categories/tecnomecanica.png",
        "title": "Tecno mecánica",
        "status": getTecnoStatusText(),
      },
      {
        "image": "assets/categories/extintor.png",
        "title": "Extintor",
        "status": colorStatus.none,
      },
      {
        "image": "assets/categories/cambiodeaceite.png",
        "title": "Aceite",
        "status": colorStatus.none,
      },
      {
        "image": "assets/categories/baterias.png",
        "title": "Bateria",
        "status": colorStatus.none,
      },
    ].obs;
  }

  colorStatus getTecnoStatusText() {
    final vehiclesData = authController.vehiclesData.value;
    final vehicleSelectedIndex = authController.vehicleSelected.value;

    return (vehiclesData != null &&
            vehiclesData.length > vehicleSelectedIndex &&
            vehiclesData[vehicleSelectedIndex].tecnomechanics != null &&
            vehiclesData[vehicleSelectedIndex].tecnomechanics!.isNotEmpty &&
            vehiclesData[vehicleSelectedIndex].tecnomechanics![0]?.dateExpiry !=
                null)
        ? (vehiclesData[vehicleSelectedIndex]
                .tecnomechanics![0]!
                .dateExpiry!
                .isBefore(DateTime.now())
            ? colorStatus.inactive
            : colorStatus.active)
        : colorStatus.none;
  }

  colorStatus getSoatStatusText() {
    final vehiclesData = authController.vehiclesData.value;
    final vehicleSelectedIndex = authController.vehicleSelected.value;

    return (vehiclesData != null &&
            vehiclesData[vehicleSelectedIndex].soats != null &&
            vehiclesData[vehicleSelectedIndex].soats!.isNotEmpty &&
            vehiclesData[vehicleSelectedIndex].soats![0].endDate != null)
        ? (vehiclesData[vehicleSelectedIndex]
                .soats![0]
                .endDate!
                .isBefore(DateTime.now())
            ? colorStatus.inactive
            : colorStatus.active)
        : colorStatus.none;
  }

  String setStringStatus(status) {
    switch (status) {
      case colorStatus.active:
        return "Vigente";

      case colorStatus.inactive:
        return "Vencido";

      default:
        return "Configurar";
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
}
