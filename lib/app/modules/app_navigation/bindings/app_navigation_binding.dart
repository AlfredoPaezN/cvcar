import 'package:cvcar_mobile/app/api/api.dart';
import 'package:cvcar_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

import '../controllers/app_navigation_controller.dart';

class AppNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => DashboardController());

    Get.lazyPut<AppNavigationController>(
      () => AppNavigationController(),
    );
  }
}
