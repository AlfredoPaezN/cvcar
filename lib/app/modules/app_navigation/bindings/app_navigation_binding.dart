import 'package:cvcar_mobile/app/api/api.dart';
import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:cvcar_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:cvcar_mobile/app/modules/my_account/controllers/my_account_controller.dart';
import 'package:cvcar_mobile/app/modules/pit_area/controllers/pit_area_controller.dart';
import 'package:cvcar_mobile/app/modules/vehicle_detail/controllers/vehicle_detail_controller.dart';
import 'package:cvcar_mobile/app/service/auth_service.dart';
import 'package:cvcar_mobile/app/service/user_service.dart';
import 'package:get/get.dart';

import '../controllers/app_navigation_controller.dart';

class AppNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => AuthService(
          apiClient: Get.find(),
        ));
    Get.lazyPut(() => AuthController(
          userService: Get.find(),
          authService: Get.find(),
          apiClient: Get.find(),
        ));
    Get.lazyPut(() => DashboardController(
          authController: Get.find(),
        ));
    Get.lazyPut(() => VehicleDetailController(
          authController: Get.find(),
        ));
    Get.lazyPut(() => MyAccountController(
          authController: Get.find(),
        ));
    Get.lazyPut(() => UserService(apiClient: Get.find()));
    Get.lazyPut(() => PitAreaController());

    Get.lazyPut<AppNavigationController>(
      () => AppNavigationController(
        authController: Get.find(),
      ),
    );
  }
}
