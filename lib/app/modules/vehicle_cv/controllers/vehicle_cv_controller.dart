import 'package:cvcar_mobile/app/modules/auth/auth_controller.dart';
import 'package:get/get.dart';

class VehicleCvController extends GetxController {
  AuthController authController;
  VehicleCvController({required this.authController});
  RxBool isExpanded = false.obs;
  RxList<int> cardIndexOpennedList = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  handleExpand(int index) {
    if (cardIndexOpennedList.contains(index)) {
      cardIndexOpennedList.remove(index);
    } else {
      cardIndexOpennedList.add(index);
    }
  }
}
