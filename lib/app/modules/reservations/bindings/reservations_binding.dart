import 'package:get/get.dart';

import '../controllers/reservations_controller.dart';

class ReservationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationsController>(
      () => ReservationsController(),
    );
  }
}
