import 'package:cvcar_mobile/app/service/user_service.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserService(
          apiClient: Get.find(),
        ));
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        userService: Get.find(),
      ),
    );
  }
}
