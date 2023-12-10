import 'package:get/get.dart';

import '../controllers/register_vehicle_controller.dart';

class RegisterVehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterVehicleController>(
      () => RegisterVehicleController(),
    );
  }
}
