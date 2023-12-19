import 'package:get/get.dart';

import '../controllers/vehicle_cv_controller.dart';

class VehicleCvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleCvController>(
      () => VehicleCvController(),
    );
  }
}
