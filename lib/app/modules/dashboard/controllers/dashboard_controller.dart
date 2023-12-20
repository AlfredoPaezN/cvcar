import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  AuthController authController;
  DashboardController({required this.authController});
  Rxn<List<Map<String, String>>> categories = Rxn<List<Map<String, String>>>();

  @override
  void onInit() {
    categories.value = [
      {
        "image": "assets/categories/SOAT.png",
        "title": "SOAT",
        "status": authController
                    .vehiclesData
                    .value?[authController.vehicleSelected.value]
                    .soats?[0]
                    .isExpired ??
                false
            ? "Expirado"
            : "Vigente",
      },
      {
        "image": "assets/categories/tecnomecanica.png",
        "title": "Tecno mecánica",
        "status": authController
                    .vehiclesData
                    .value?[authController.vehicleSelected.value]
                    .tecnomechanics?[0]
                    .isExpired ??
                false
            ? "Expirado"
            : "Vigente",
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
