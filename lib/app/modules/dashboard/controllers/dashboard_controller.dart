import 'package:get/get.dart';

class DashboardController extends GetxController {
  final categories = [
    {
      "image": "assets/categories/SOAT.png",
      "title": "SOAT",
      "status": "Vigente",
    },
    {
      "image": "assets/categories/tecnomecanica.png",
      "title": "Tecno mecánica",
      "status": "Vigente",
    },
    {
      "image": "assets/categories/extintor.png",
      "title": "Extintor",
      "status": "Vigente",
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
