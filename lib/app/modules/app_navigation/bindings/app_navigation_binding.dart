import 'package:get/get.dart';

import '../controllers/app_navigation_controller.dart';

class AppNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppNavigationController>(
      () => AppNavigationController(),
    );
  }
}
