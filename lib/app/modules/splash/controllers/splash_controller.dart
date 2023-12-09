import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool showQuote = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), () {
      showQuote.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        Get.offNamed(Routes.ONBOARDING);
      });
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
