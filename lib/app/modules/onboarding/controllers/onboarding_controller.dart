import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;
  RxString title = "BIENVENIDO A CVCAR".obs;
  RxString subtitle =
      "Registra tu vehiculo, escribe tu propia historia y consulta sus datos en cualquier momento"
          .obs;
  final Rx<PageController> pageController = PageController().obs;

  void navigationRoutes() async {
    final box = GetStorage();
    box.write("is_onboarding_passed", true);

    Get.offAndToNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
  }

  getTitle(page) {
    switch (page) {
      case 0:
        title.value = "BIENVENIDO A CVCAR";
        break;

      case 1:
        title.value = "ZONA DE PITS";
        break;

      case 2:
        title.value = "GANA PUNTOS CVCAR";
        break;

      default:
        title.value = "SI VES ESTO ALGO SALIO MAL";
        break;
    }
  }

  getSubtitle(page) {
    switch (page) {
      case 0:
        subtitle.value =
            "Registra tu vehiculo, escribe tu propia historia y consulta sus datos en cualquier momento";
        break;
      case 1:
        subtitle.value = "Encuentra los mejores servicios para tu auto";
        break;

      case 2:
        subtitle.value = "Acumula puntos y canjealos por increibles premios";
        break;
      default:
        subtitle.value = "SI VES ESTO ALGO SALIO MAL";
        break;
    }
  }
}
