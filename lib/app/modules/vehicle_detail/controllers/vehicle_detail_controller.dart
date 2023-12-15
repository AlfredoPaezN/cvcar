import 'package:cvcar_mobile/app/models/license.dart';
import 'package:cvcar_mobile/app/models/vehicle.dart';
import 'package:get/get.dart';

class VehicleDetailController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Vehicle exampleData = Vehicle(
      color: "BLANCO GALAXIA",
      marca: "Cherrolet",
      tipoCombustible: "GASOLINA",
      linea: "ONIX",
      transito: "9CJFHUEH9374YO",
      numeroChasis: "STRIA MCPAL TY04308RUK",
      tipoServicio: "Particular",
      modelo: "2016",
      clase: "Automovil",
      cilindraje: "DRM001093",
      numeroMotor: "1796");

  License exampleLicense = License(
    nombre: "Andrea Daguer Gomez",
    numeroLicencia: "1245377543",
    categoria: "B1",
    fechaExpedicion: "12/07/2018",
    fechaVencimiento: "12/07/2028",
  );

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
