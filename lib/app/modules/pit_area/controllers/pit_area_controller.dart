import 'package:cvcar_mobile/app/modules/pit_area/views/pit_area_view.dart';
import 'package:get/get.dart';

class PitAreaController extends GetxController {
  RxInt categorieSelected = 20.obs;
  Map<String, Categorie> categories = {
    "0": const Categorie(
        imagePath: "assets/categories/lavadas.png", label: "Lavaderos"),
    "1": const Categorie(
        imagePath: "assets/categories/llantas.png", label: "Llantas"),
    "2": const Categorie(
        imagePath: "assets/categories/mantenimientogeneral.png",
        label: "Repuestos"),
    "3": const Categorie(
      imagePath: "assets/categories/cambiodeaceite.png",
      label: "Lubricentros",
    ),
    "4": const Categorie(
      imagePath: "assets/categories/talleres.png",
      label: "Talleres",
    ),
    "5": const Categorie(
      imagePath: "assets/categories/combustible.png",
      label: "EDS",
    ),
    "6": const Categorie(
      imagePath: "assets/categories/kilometraje.png",
      label: "Accesorios",
    ),
    "7": const Categorie(
      imagePath: "assets/categories/Carroceria.png",
      label: "Carroceria",
    ),
    "8": const Categorie(
      imagePath: "assets/categories/grupo.png",
      label: "Herramientas",
    ),
    "9": const Categorie(
        imagePath: "assets/categories/baterias.png", label: "Baterías"),
  };

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
