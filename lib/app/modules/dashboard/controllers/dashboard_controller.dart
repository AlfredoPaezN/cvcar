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
      "image": "assets/categories/kitdecarretera.png",
      "title": "Kit de carretera",
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
