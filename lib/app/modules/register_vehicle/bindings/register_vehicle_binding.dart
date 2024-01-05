import 'package:cvcar_mobile/app/service/register_vehicle_service.dart';
import 'package:get/get.dart';

import '../controllers/register_vehicle_controller.dart';

class RegisterVehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VehicleService(
          apiClient: Get.find(),
        ));
    Get.lazyPut<RegisterVehicleController>(
      () => RegisterVehicleController(
        appNavigationController: Get.find(),
        authController: Get.find(),
        registerVehicleService: Get.find(),
      ),
    );
  }
}
