import 'package:get/get.dart';

import '../controllers/pit_area_controller.dart';

class PitAreaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PitAreaController>(
      () => PitAreaController(),
    );
  }
}
