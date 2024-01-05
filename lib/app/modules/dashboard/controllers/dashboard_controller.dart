import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  AuthController authController;
  DashboardController({required this.authController});
  Rxn<List<Map<String, String>>> categories = Rxn<List<Map<String, String>>>();

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
        "status": "Configurar",
      },
      {
        "image": "assets/categories/cambiodeaceite.png",
        "title": "Aceite",
        "status": "Configurar",
      },
      {
        "image": "assets/categories/baterias.png",
        "title": "Bateria",
        "status": "Configurar",
      },
    ].obs;
  }

  String getTecnoStatusText() {
    final vehiclesData = authController.vehiclesData.value;
    final vehicleSelectedIndex = authController.vehicleSelected.value;

    return (vehiclesData != null &&
            vehiclesData.length > vehicleSelectedIndex &&
            vehiclesData[vehicleSelectedIndex].tecnomechanics != null &&
            vehiclesData[vehicleSelectedIndex].tecnomechanics!.isNotEmpty &&
            vehiclesData[vehicleSelectedIndex].tecnomechanics![0]?.isExpired !=
                null)
        ? (vehiclesData[vehicleSelectedIndex].tecnomechanics![0]!.isExpired!
            ? "Expirado"
            : "Vigente")
        : "No data";
  }

  String getSoatStatusText() {
    final vehiclesData = authController.vehiclesData.value;
    final vehicleSelectedIndex = authController.vehicleSelected.value;

    return (vehiclesData != null &&
            vehiclesData.length > vehicleSelectedIndex &&
            vehiclesData[vehicleSelectedIndex].soats != null &&
            vehiclesData[vehicleSelectedIndex].soats!.isNotEmpty &&
            vehiclesData[vehicleSelectedIndex].soats![0].isExpired != null)
        ? (vehiclesData[vehicleSelectedIndex].soats![0].isExpired!
            ? "Expirado"
            : "Vigente")
        : "No data";
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
