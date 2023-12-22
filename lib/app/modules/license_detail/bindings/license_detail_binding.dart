import 'package:get/get.dart';

import '../controllers/license_detail_controller.dart';

class LicenseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LicenseDetailController>(
      () => LicenseDetailController(
        authController: Get.find(),
      ),
    );
  }
}
