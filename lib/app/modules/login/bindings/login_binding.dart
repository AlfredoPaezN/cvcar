import 'package:cvcar_mobile/app/api/api.dart';
import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:cvcar_mobile/app/service/auth_service.dart';
import 'package:cvcar_mobile/app/service/user_service.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => UserService(
          apiClient: Get.find(),
        ));
    Get.lazyPut(() => AuthService(
          apiClient: Get.find(),
        ));
    Get.lazyPut(() => AuthController(
          userService: Get.find(),
          authService: Get.find(),
        ));
    Get.lazyPut<LoginController>(
      () => LoginController(
        authController: Get.find(),
        // authService: Get.find(),
      ),
    );
  }
}
