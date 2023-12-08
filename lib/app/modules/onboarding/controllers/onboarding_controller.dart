import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;

  void navigationRoutes() async {
    final box = GetStorage();
    box.write("is_onboarding_passed", true);

    Get.offAndToNamed(Routes.LOGIN);
  }
}
